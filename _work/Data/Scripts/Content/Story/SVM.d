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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_1_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//Tak jsem tê pâece jen dostal!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Proto jsi tady!
	DieMonster					=	"SVM_1_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_1_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Tak to tê odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//Tak co jsi tam teda dêlal, no?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Tak pâestaneš s tím už!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//Trochu velký sousto, co, ty bâídile!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš? Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_1_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//POPLACH!
	Guards						=	"SVM_1_Guards"						;//STRÁŽE!
	Help						=	"SVM_1_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_1_GoodKill"					;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(hlasitê kâièí) Hej, stùj, ty špinavèe!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro zaèátek.
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Ten mizera u sebe nemá žádný zlato.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(varovnê) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(agresivnê) Ještê nemáš dost?
	StopMagic					=	"SVM_1_StopMagic"					;//Nepâibližuj se ke mnê s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Pâestaà s tou magií! Máš snad nêco s ušima!?
	WeaponDown					=	"SVM_1_WeaponDown"					;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Seš snad hluchej, nebo co? Âekl jsem: Dej pryè tu zbraà!
	WiseMove					=	"SVM_1_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(pro sebe) Ještê se uvidí.
	OhMyHead					=	"SVM_1_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(dychtivê) Koneènê se nêco dêje!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(vystrašenê) Vymlátí si navzájem mozky z hlavy.
	GoodVictory					=	"SVM_1_GoodVictory"					;//(zlý smích) Koledoval si o to!
	NotBad						= 	"SVM_1_NotBad"						;//(souhlasnê) To nebylo vùbec špatné.
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(pro sebe) Takový surovec...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Tak na co èekáš?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Výbornê!
	Ooh01						=	"SVM_1_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_1_Ooh02"						;//Ukaž mu, kdo je tady šéf!
	Ooh03						=	"SVM_1_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Vypadni z mé postele!
	Awake						= "SVM_1_Awake"							;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Slyšel jsem, že jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Slyšel jsem, že jsi zašel za otcem Parlanem a vyzpovídal ses mu ze svých hâíchù.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Âíká se, že jsi zašel za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Takhle vraždit naše ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//S mizernejma grázlama se nebavím!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Jdi mi z oèí, ty špinavej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Jsi ostudou svého âádu! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Jsi ostudou mêstských stráží! Lord Andre tê ještê nauèí zpùsobùm!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre se dozví o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Otec Parlan nebude nadšený, až uslyší o tvých hâíších!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Lee ti dá co proto! Ještê uvidíš, co sis nadrobil!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Velitel Garond po tobê bude chtít vysvêtlení!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//Tak dobrá, dobrá, vyhrál jsi. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(nafoukanê) Mám ti znovu ukázat, kdo je tady pánem?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 zlatých.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 zlatých.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 zlatých.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 zlatých.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 zlatých.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 zlatých.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 zlatých.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 zlatých.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 zlatých.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 zlatých.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 zlatých.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 zlatých.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 zlatých.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 zlatých.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 zlatých.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 zlatých.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 zlatých.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 zlatých.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 zlatých.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 zlatých.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 zlatých.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 zlatých.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 zlatých.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 zlatých.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 zlatých.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 zlatých.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 zlatých.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...vážnê si myslíš...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...všechno je možné...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...mêl si to rozmyslet...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...jako bych už tak nemêl dost problémù...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...kdo to âekl...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...z toho budou jen další problémy...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...drbalo se tam o všem možném...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...nemêl jsem to dêlat...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...to všechno jsou jen âeèi...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...radêji bys mêl zjistit, kdo to âíkal...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...chtêl jsem ti to âíct dâív...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...nikdo se mê neptal...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...mêl bys mít soucit s chudákem...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...to není nic nového...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...je to úplnê jasné...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...nemêl ses mê ptát, co...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...však víš, co myslím...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...je to pâesnê tak, jak jsem âíkal...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...už to nemùže nic zmênit...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...proè mi o tom nikdo neâekl dâív...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...poèkejme a uvidíme, co se stane...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...nêkteré problémy se vyâeší samy...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...už o tom nechci nic slyšet...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...zaèal pít...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...všichni utekli jak vyplašení králíci, zùstal jsem úplnê sám...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...tak stojí v Písmu...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...vždycky jsem konal ve jménu Innose...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//... nikdo se nesmí protivit vùli boží...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_1_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_1_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_1_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_1_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_1_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Když nenosíš náš stejnokroj, nebudu se s tebou bavit.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Co to máš na sobê? Obleè se trochu slušnê!
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Seš voják, tak se taky tak oblíkej!
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Nêco takového by èlen našeho âádu nosit nemêl. Bêž se pâevléknout.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sobê nemáš ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Chcípni, ty hnusnej bandito!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Ty hajzle pirátská!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_3_Weather"					;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Tak jsem tê pâece dostal!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Rozsekám tê na kousky!
	DieMonster					=	"SVM_3_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_3_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Tak ty nepùjdeš? Jak chceš!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Cos tam pohledával?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Zasloužil sis to, nièemo!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš? Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Neubližuj mi!
	RunAway						= 	"SVM_3_RunAway"					;//A do hajzlu!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//POPLACH!
	Guards						=	"SVM_3_Guards"					;//STRÁŽE!
	Help						=	"SVM_3_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_3_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(kâièí) Jo! Utíkej, jak nejrychleji mùžeš!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Ještê poâád nemáš dost?
	StopMagic					=	"SVM_3_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Chceš napráskat? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_3_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_3_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(nedoèkavê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(zlý smích) Ukázals mu, kdo je tady pánem!
	NotBad						= 	"SVM_3_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková krutost...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Tak ho prašã!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Dej to sem všechno!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Ukaž mu!
	Ooh01						=	"SVM_3_Ooh01"					;//Poèkej!
	Ooh02						=	"SVM_3_Ooh02"					;//Dávej pozor!
	Ooh03						=	"SVM_3_Ooh03"					;//Jó! To byla trefa!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_3_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Prý jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Prý jsi zašel za otcem Parlanem, aby ses vyzpovídal ze svých hâíchù.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Prý jsi zašel za Leem a dal ty vêci do poâádku.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Takhle vraždit naše ovce!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Nech mê na pokoji, ty špinavý zvíâe!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Nech mê na pokoji, ty mizernej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Jsi ostudou svého âádu! Poèkej, až se o tom dozví lord Hagen!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Jsi ostudou mêstských stráží! Poèkej, až se o tom dozví lord Andre!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Poèkej, až se o tom dozví lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Poèkej, až se o tom dozví otec Parlan!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Poèkej, až se to donese Leeovi...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Poèkej, až se o tom dozví velitel Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Dobrá, dobrá, jsi lepší bojovník než já. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(arogantnê) Mám dojem, že už ti musí být jasné, kdo je tady ten silnêjší... Co chceš?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Mêl jsem dojem, že ses na mê pokoušel vytáhnout zbraà. To sis to rozmyslel? Ty spíš dáváš pâednost ROZHOVORU, co? (smích)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 zlatých.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...vážnê si myslíš...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...všechno je možné...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...mêl si to rozmyslet...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...jako bych nemêl dost problémù...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...kdo ti to âekl...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...z toho budou jen další problémy...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...drbalo se tam o všem možném...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...nemêl jsem na to nikdy ani pomyslet...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...to všechno jsou jen âeèi...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...bude lepší zjistit, kdo ti âekl, že...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...chtêl jsem ti to âíct dâív...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...nikdo se mê neptal...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...mêl bys mít soucit s chudákem...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...to není nic nového...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...je to úplnê jasné...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...nemêl ses mê ptát, co...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...však víš, co myslím...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...je to pâesnê tak, jak jsem âíkal...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...už to nemùže nic zmênit...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...proè mi o tom nikdo neâekl dâív...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...poèkejme a uvidíme, co se stane...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...nêkteré problémy se vyâeší samy...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...už o tom nechci nic slyšet...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...zaèal pít...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...všichni utekli jak vyplašení králíci, zùstal jsem úplnê sám...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...tak stojí v Písmu...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...vždycky jsem konal ve jménu Innose...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...nikdo se nesmí protivit vùli bohù...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_3_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_3_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_3_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_3_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_3_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Co to máš na sobê? Vùbec se to k tobê nehodí. Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Jestli si chceš promluvit, tak se napâed poâádnê obleè.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//My vojáci nosíme svùj stejnokroj s hrdostí. Bêž se pâevlíct.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//V našem âádu platí, že se všichni oblékáme stejnê. Tak se koukej pâevléci!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Ty jsi snad právê vylezl z lochu. Napâed si sežeà nêco na sebe!

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//POCEM, TY ZATRACENEJ BANDITO!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//POCEM, TY ZATRACENEJ PIRÁTE!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_4_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//Už zase TY!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Rozsekám tê na kousky!
	DieMonster					=	"SVM_4_DieMonster"					;//Další z têch vêcí!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ty mizernej zlodêji!
	HandsOff					=	"SVM_4_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hej! Nech naše ovce na pokoji!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Ta obluda vraždí naše ovce!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//Co tam ta bestie provádí?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//Sám sis o to âekl!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Âekl sis o to.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Mám dojem, že by nêkterým lidem neuškodilo, kdyby poznali, zaè je toho loket.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Co tam dêláš, co!?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Tak pâestaneš s tím už!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Chcípni!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Takovej blbej bastard...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//Dobrá, to na tebe bylo trochu moc, co, ty mizerná bestie!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Okamžitê dej ty svý špinavý pracky pryè z mejch vêcí, jasný?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Hlídej si ty svoje ukoptêný prsty!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Okamžitê dej ty svoje umounêný pracky pryè od našich ovcí!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Tohle už nikdy nezkoušej, kámo!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Doufám, že sis z toho vzal ponauèení.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Vstávej a vypadni odsud!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Aã už tê tu nikdy nevidím - jasný?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Já jsem ten, kdo tady rozdává rány, rozumíš?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_4_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//POPLACH!
	Guards						=	"SVM_4_Guards"					;//STRÁŽE!
	Help						=	"SVM_4_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(volá) Jo! Takhle se na to musí!
	GoodKill					= 	"SVM_4_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(kâièí) Ještê se uvidíme!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Ven!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Co tady chceš?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Jen mu nandej!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Co tady kolem èmucháš?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(vstává) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(agresivnê) Koleduješ si!
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Chceš napráskat? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_4_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_4_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(dychtivê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(zlý smích) Ukázals mu, kdo je tady pánem!
	NotBad						= 	"SVM_4_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková krutost...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Jo, nandej mu to!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Ukaž mu!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_4_Ooh01"					;//Braà se!
	Ooh02						=	"SVM_4_Ooh02"					;//Pokraèuj, vraã mu to!
	Ooh03						=	"SVM_4_Ooh03"					;//Au! Taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(pro sebe, vstává) Sakra, co zas bylo TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Vypadni z mé postele!
	Awake						= "SVM_4_Awake"						;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Tak velitel dal ty vêci do poâádku.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Tak ty jsi uèinil pokání u otce Parlana...
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Slyšel jsem, že Lee dal ty vêci do poâádku.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Dobrá.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Vraždêní ovcí už bylo dost! Ztraã se!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Jsi grázl - ztraã se!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Zatracenej zlodêji! Už tê mám právê tak dost!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Od paladina bych oèekával nêco jiného! To se nebude lordu Hagenovi líbit.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Jak se nêkdo jako ty mohl dostat k mêstským strážím? Lord Andre ti to ještê spoèítá!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre se o tvém chování dozví!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Otec Parlan nebude mít z tvého poèínání žádnou radost!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Lee to nenechá jen tak!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Velitel Garond nebude mít radost, až to uslyší - za to zaplatíš!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Máš docela sílu... co žes to chtêl?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(domýšlivê) Nêjaké další otázky?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//Už zase TY!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 zlatých.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...vážnê je to tak...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...to není to, co jsem slyšel...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...neâíkej mi, žes o tom nevêdêl...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...v tyhle dny ani nevíš, komu máš vêâit...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...všechno to jsou jen drby...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...nejsem o nic šãastnêjší...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...už mê nemùže nic pâekvapit...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...to vážnê není mùj problém...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...opravdu si myslíš, že...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...nikdo se ode mê nic nedozví...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...všem to bylo jasné...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...naslouchal špatným lidem...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...pokud to sám nevidí, nemùžu mu nijak pomoct...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...neâíkám ti nic nového...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...nikdy by na to sám nepâišel...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...to už se ví dlouho...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...to je špatný obchod...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...mêl jsem to udêlat jinak...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...úplnê s tebou souhlasím...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...to nic nezmêní...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...nikdy by mê nenapadlo, že...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...už s tím nic nenadêláš...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...to mê nepâekvapuje...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...ale to ne, on vêdêl všechno nejlíp...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...situace je vážná, tak mi neâíkej, že...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...ještê ani nevêdêl, jak poâádnê držet meè...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...jo, vážnê âekl, že...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...za tohle nêkdo zaplatí...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos nenechá v nevêdomosti nikoho, kdo rozpozná jeho moudrost...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...spravedlnost nakonec zvítêzí...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Už tê nemùžu nauèit nic dalšího. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_4_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_4_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_4_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_4_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_4_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Napâed se slušnê obleè a pak si promluvíme.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Napâed si oblíkni zbroj, jinak se s tebou nebudu bavit.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Copak ti nikdo nedal naši zbroj? No tak si ji obleè!
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Kde máš roucho? Bêž se pâevléct, jinak se s tebou nebudu bavit.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Co jsi to za chudáka? Vraã se, až si budeš moct dovolit aspoà zbroj!

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Další bandita!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Ty špinavej piráte!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_5_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//Tak jsem tê pâece jen dostal!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Sám sis o to âekl!
	DieMonster					=	"SVM_5_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_5_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Tak to tê odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Tak co jsi tam teda dêlal, no?!
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Trochu velký sousto, co, ty bâídile!
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Už se nikdy nepokoušej mê okrást!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš? Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_5_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//POPLACH!
	Guards						=	"SVM_5_Guards"						;//STRÁŽE!
	Help						=	"SVM_5_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_5_GoodKill"					;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(hlasitê kâièí) Hej, stùj, ty špinavèe!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro zaèátek.
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Ty u sebe nemáš žádné zlato?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(varovnê) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(agresivnê) Ještê nemáš dost?
	StopMagic					=	"SVM_5_StopMagic"					;//Nepâibližuj se ke mnê s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Pâestaà s tou magií! Máš snad nêco s ušima!?
	WeaponDown					=	"SVM_5_WeaponDown"					;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Seš snad hluchej, nebo co? Âekl jsem: Dej pryè tu zbraà!
	WiseMove					=	"SVM_5_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(pro sebe) Ještê se uvidí.
	OhMyHead					=	"SVM_5_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(dychtivê) Koneènê se nêco dêje!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(vystrašenê) Ale vždyã si navzájem vytluèou mozek z hlavy.
	GoodVictory					=	"SVM_5_GoodVictory"					;//(zlý smích) Koledoval si o to!
	NotBad						= 	"SVM_5_NotBad"						;//(souhlasnê) To nebylo vùbec špatné.
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(pro sebe) Takový surovec...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Tak na co èekáš?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Výbornê!
	Ooh01						=	"SVM_5_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_5_Ooh02"						;//Ukaž mu, kdo je tady šéf!
	Ooh03						=	"SVM_5_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Vypadni z mé postele!
	Awake						= "SVM_5_Awake"							;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Slyšel jsem, že jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Slyšel jsem, že jsi zašel za otcem Parlanem a uèinil pokání.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//Slyšel jsem, že jsi zašel za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Takhle vraždit naše ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//S mizernejma grázlama se nebavim!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Jdi mi z oèí, ty špinavej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Jsi ostudou svého âádu! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Jsi ostudou mêstských stráží! Lord Andre tê ještê nauèí zpùsobùm!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre se dozví o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Otec Parlan nebude nadšený, až uslyší o tvých hâíších!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee ti dá co proto! Ještê uvidíš, co sis nadrobil!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Velitel Garond po tobê bude chtít vysvêtlení!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//Tak dobrá, dobrá, vyhrál jsi. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(nafoukanê) Mám ti znovu ukázat, kdo je tady pánem?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 zlatých.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 zlatých.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 zlatých.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 zlatých.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 zlatých.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 zlatých.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 zlatých.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 zlatých.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 zlatých.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 zlatých.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 zlatých.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 zlatých.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 zlatých.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 zlatých.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 zlatých.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 zlatých.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 zlatých.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 zlatých.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 zlatých.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 zlatých.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 zlatých.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 zlatých.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 zlatých.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 zlatých.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 zlatých.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 zlatých.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 zlatých.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...vážnê si myslíš...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...všechno je možné...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...mêl si to rozmyslet...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...jako bych nemêl dost problémù...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...kdo ti to âekl...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...z toho budou jen další problémy...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...drbalo se tam o všem možném...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...nemêl jsem to dêlat...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...to všechno jsou jen âeèi...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...radêji bys mêl zjistit, kdo to âíkal...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...chtêl jsem ti to âíct dâív...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...nikdo se mê neptal...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...mêl bys mít soucit s chudákem...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...to není nic nového...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...je to úplnê jasné...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...nemêl ses mê ptát, co...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...však víš, co myslím...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...je to pâesnê tak, jak jsem âíkal...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...už to nemùže nic zmênit...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...proè mi o tom nikdo neâekl dâív...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...poèkejme a uvidíme, co se stane...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...nêkteré problémy se vyâeší samy...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...už o tom nechci nic slyšet...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...zaèal pít...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...všichni utekli jak vyplašení králíci, zùstal jsem úplnê sám...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...tak stojí v Písmu...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...vždycky jsem konal ve jménu Innose...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...nikdo se nesmí protivit vùli bohù...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_5_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_5_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_5_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_5_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_5_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Napâed si na sebe vem nêco slušného.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//Co to máš na sobê? To už k nám jako nepatâíš? Pak s tebou taky nechci nic mít.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//My vojáci bojujeme ve jménu krále, tak bys mêl taky nosit jeho zbroj!
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Naè ti náš âád vênoval roucho, když je nenosíš? Popâemýšlej o tom.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Co jsi to za chudáka? To nemáš žádné brnêní? Bêž pryè.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Á, bandita.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Rozsekám tê na kousíèky, piráte pirátská!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_6_Weather"					;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Dostanu tê!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Nemêl jsi sem chodit!
	DieMonster					=	"SVM_6_DieMonster"					;//Pojë sem, ty zatracená bestie!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_6_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Nech naše ovce na pokoji!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Táhni od našich ovcí, ty zvíâe!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Toho budeš litovat!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Jako bych tê nevaroval.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hej, VYPADNI!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hej! Co tam chceš?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Pâestaà! Hned!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Nezbude z tebe ani mastnej flek, ty bastarde!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//To na tebe bylo trochu moc.
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Hej, Poâád to ještê mám!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Varuju tê! Už to znovu nezkoušej, ty mizernej zlodêji!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//A už se k našim ovcím nepâibližuj!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Neopovažuj se na mê znovu zaútoèit!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Jako bych tê nevaroval.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Už tê tam nikdy nechci vidêt, jasný?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Tady se žádné rvaèky nestrpí, jasné?! Doufám, že sis z toho vzal ponauèení.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Nezkoušej žádné legrácky!
	RunAway						= 	"SVM_6_RunAway"						;//Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//POPLACH!
	Guards						=	"SVM_6_Guards"					;//STRÁŽE!
	Help						=	"SVM_6_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(volá) Pošli ty bestie do vêèných lovišã!
	GoodKill					= 	"SVM_6_GoodKill"				;//(volá) Jo, dej têm bastardùm co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(hlasitê kâièí) Ještê tê dostanu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Nemáš tady co pohledávat!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Jo, vypadni!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Co máš za lubem? Co má znamenat všechno to èmuchání kolem?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(vstává) Sakra, co chceš?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Dobrá, když už nic jiného, alespoà máš u sebe nêjaké zlato.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Ani zlaãák - hmpf.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Asi si vezmu tvoji zbraà.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(varovnê) Tak tohle už, hochu, víckrát nedêlej!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(agresivnê) Potâebuješ ještê další výprask?
	StopMagic					=	"SVM_6_StopMagic"				;//Pâestaà s têmi kouzly!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Poslední varování! Pâestaà s têmi kouzly!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Dej tu zbraà pryè!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Schovej tu zbraà, nebo v tom seš až po uši!
	WiseMove					=	"SVM_6_WiseMove"				;//Hej, ty nejsi tak blbej, jak vypadáš!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(pro sebe) Tohle už znovu nezkoušej.
	OhMyHead					=	"SVM_6_OhMyHead"				;//(pro sebe) Ó! Moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(dychtivê) Aã je koneènê nêjaká zábava.
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(vydêšenê) Ó, mùj bože...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(zlý smích) Aã si z toho vezme ponauèení.
	NotBad						= 	"SVM_6_NotBad"					;//(souhlasnê) To byla trefa!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(pro sebe) Takový surovec!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Dej mu!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Teë nepâestávej!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_6_Ooh01"					;//Dávej pozor!
	Ooh02						=	"SVM_6_Ooh02"					;//Tak mu to vraã!
	Ooh03						=	"SVM_6_Ooh03"					;//Do hajzlu, taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_6_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Tak velitel dal ty vêci do poâádku.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Tak tê otec Parlan zbavil viny.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Tak jsi zašel za Leem a vyâešil situaci.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Dobrá.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Ty vraždíš ovce? Pâedpokládám, že se ti nepodaâilo najít nikoho bezbrannêjšího?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//S odpornejma banditama nechci nic mít!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Se zlodêji nechci mít nic spoleèného!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//A ty se chceš stát paladinem? Poèkej, dokud ti lord Hagen neâekne, co si o tom myslí!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Vážnê se chceš stát èlenem mêstských stráží? Lord Andre tê v tom nehodlá podpoâit!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Zajdi za lordem Andrem, dokud mùžeš.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Zajdi za otcem Parlanem. Pomùže ti odèinit tvé hâíchy!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee se o tom dozví a ty za to zaplatíš.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Velitel Garond z toho nebude nadšený. Udêláš líp, když mu o tom âekneš dâív, než se situace ještê zhorší!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Dobrá, vyhrál jsi. Tak co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(arogantnê) Mám dojem, že už jsi pochopil, s kým máš tu èest. Co chceš?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Zase ty? Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 zlatých.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...nemùžu uvêâit, že...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...nebyl bych si tak jistý...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...ale on ví, že všichni...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...stêží vím, komu vêâit...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...nevím, co ho tak rozrušilo...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...už tak jsem v poâádný bryndê...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...zaslechl jsem jednu, dvê zvêsti...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...nezajímá mê, že...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...nesmíš vêâit všemu, co slyšíš...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...to nemá ode mê...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...už jsem o tom dost pâemýšlel...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...nikdo se mê neptal na názor...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...vážnê si nezasloužil, aby...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...neâíkej, žes nevêdêl, že...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...bylo to docela jasné...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...tak kde jsi k tomu teda pâišel...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...mám na to svùj vlastní názor...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...bylo to pâesnê tak, jak jsi âíkal...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...nevêâím tomu, že by se to mohlo zmênit...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...to je poprvé, co o tom slyším...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...prostê poèkáme a uvidíme...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...vêdêl jsem, že nás èekají problémy...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...tak proè mê neposlouchal...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...bêžel, jako by mu byl v patách samotný Beliar...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...jasnê že jsme nakonec dostali...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...mêl bys do toho zasáhnout a situaci vyâešit...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...jeden nikdy neví, jak podlí mohou být...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...protože je to vùle Innosova...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...jeho skutky byly jen...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_6_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_6_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_6_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_6_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_6_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//Vždyã vypadáš jako kašpar. Oblékni si nêco slušného!
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Vùbec tê nepoznávám. Táhni a vraã se, až se pâevlíkneš.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Vojíne, co to máš na sobê? Okamžitê se pâevleè, tady a teë!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Innosova služebníka musí každý zdálky poznat. Takže si bêž obléci roucho.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Chodíš tu v hadrech jak obyèejnej kopáè. Koukej si nêco oblíct.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Tak teë jsi kápl na toho nepravýho, BANDITO!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Vraã se zpátky na moâe, PIRÁTE!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_7_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Už zase TY!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Rozsekám tê na kousky!
	DieMonster					=	"SVM_7_DieMonster"					;//Další z têch vêcí!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty mizernej zlodêji!
	HandsOff					=	"SVM_7_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hej! Nech naše ovce na pokoji!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Ta obluda vraždí naše ovce!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//Co tam ta bestie provádí?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Sám sis o to âekl!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Âekl sis o to.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Mám dojem, že by nêkterým lidem neuškodilo, kdyby poznali, zaè je toho loket.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Co tam dêláš, co!?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Tak pâestaneš s tím už!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Chcípni!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Takovej blbej bastard...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Dobrá, to na tebe bylo trochu moc, co, ty mizerná bestie!
	ThiefDown					=	"SVM_7_ThiefDown"					;//Okamžitê dej ty svý špinavý pracky pryè z mejch vêcí, jasný?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Hlídej si ty svoje ukoptêný prsty!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Okamžitê dej ty svoje umounêný pracky pryè od našich ovcí!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Už to víckrát nezkoušej, hochu!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Doufám, že sis z toho vzal ponauèení.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Vstávej a vypadni odsud!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Aã už tê tu nikdy nevidím - jasný?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//Já jsem ten, kdo tady rozdává rány, rozumíš?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_7_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//POPLACH!
	Guards						=	"SVM_7_Guards"					;//STRÁŽE!
	Help						=	"SVM_7_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(volá) Jo! Takhle se na to musí!
	GoodKill					= 	"SVM_7_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(kâièí) Ještê se uvidíme!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Ven!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Co tady chceš?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Jen mu nandej!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Co tady kolem èmucháš?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(vstává) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(agresivnê) Koleduješ si!
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Chceš napráskat? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_7_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_7_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(dychtivê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(zlý smích) Ukázals mu, kdo je tady pánem!
	NotBad						= 	"SVM_7_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková krutost...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Jo, nandej mu to!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Ukaž mu!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Jen mu to nandej!
	Ooh01						=	"SVM_7_Ooh01"					;//Braà se!
	Ooh02						=	"SVM_7_Ooh02"					;//Pokraèuj, vraã mu to!
	Ooh03						=	"SVM_7_Ooh03"					;//Au! Taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(pro sebe, vstává) Sakra, co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Vypadni z mé postele!
	Awake						= "SVM_7_Awake"						;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Tak velitel dal ty vêci do poâádku.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Tak jsi uèinil pokání u otce Parlana.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Slyšel jsem, že Lee dal ty vêci do poâádku.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Dobrá.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Vraždêní ovcí už bylo dost! Ztraã se!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Jsi grázl - ztraã se!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Zatracenej zlodêji! Už tê mám právê tak dost!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Od paladina bych oèekával nêco jiného! To se nebude lordu Hagenovi líbit.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Jak se nêkdo jako ty mohl dostat k mêstským strážím? Lord Andre ti to ještê spoèítá!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre se o tvém chování dozví!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Otec Parlan nebude mít z tvého poèínání žádnou radost!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee to nenechá jen tak!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Velitel Garond nebude mít radost, až to uslyší - za to zaplatíš!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Máš docela sílu... co žes to chtêl?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(domýšlivê) Nêjaké další otázky?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//Už zase TY!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 zlatých.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...vážnê je to tak...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...to není to, co jsem slyšel...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...neâíkej mi, žes o tom nevêdêl...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...v tyhle dny ani nevíš, komu máš vêâit...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...všechno to jsou jen drby...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...nejsem o nic šãastnêjší...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...už mê nemùže nic pâekvapit...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...to vážnê není mùj problém...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...opravdu si myslíš, že...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...nikdo se ode mê nic nedozví...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...všem to bylo jasné...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...naslouchal špatným lidem...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...pokud to sám nevidí, nemùžu mu nijak pomoct...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...neâíkám ti nic nového...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...nikdy by na to sám nepâišel...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...to už se ví dlouho...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...to je špatný obchod...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...mêl jsem to udêlat jinak...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...úplnê s tebou souhlasím...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...nic nezmêní...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...nikdy by mê nenapadlo, že...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...není nic, co s tím mohl dêlat...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...to mê nijak nepâekvapuje...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...ale to ne, on vêdêl všechno nejlíp...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...situace je vážná, tak mi neâíkej, že...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...ještê ani nevêdêl, jak poâádnê držet meè...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...jo, vážnê âekl, že...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...za tohle bude muset nêkdo zaplatit...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos nenechá v nevêdomosti nikoho, kdo rozpozná jeho moudrost...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...spravedlnost nakonec zvítêzí...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Už tê nemùžu nauèit nic dalšího. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_7_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_7_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_7_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_7_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_7_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Naè ten pâevlek? Takhle se s tebou bavit nebudu.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//Co to máš na sobê? Oblíkni si pâece zbroj!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//To je porušení pâedpisù o vojenském stejnokroji! Okamžitê se pâevleè, tady a teë!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Radši si oblékni roucho. Dokud to neudêláš, nic ti neâeknu a radši se za tebe budu modlit.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Co chceš? Ty k nám nepatâíš, vždyã na sobê nemáš naši zbroj!

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Zdechni, ty mizernej bandito!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Zdechni, ty hnusnej piráte!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_8_Weather"					;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Tak jsem tê pâece dostal!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Rozsekám tê na kousky!
	DieMonster					=	"SVM_8_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_8_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Tak ty nepùjdeš? Jak chceš!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Cos tam pohledával?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Zasloužil sis to, nièemo!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš?! Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Neubližuj mi!
	RunAway						= 	"SVM_8_RunAway"					;//A do hajzlu!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//POPLACH!
	Guards						=	"SVM_8_Guards"					;//STRÁŽE!
	Help						=	"SVM_8_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_8_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(kâièí) Jo! Utíkej, jak nejrychleji mùžeš!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Ještê poâád nemáš dost?
	StopMagic					=	"SVM_8_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Chceš napráskat? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_8_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_8_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(nedoèkavê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(zlý smích) Tak jsi mu to ukázal!
	NotBad						= 	"SVM_8_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková krutost...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Tak ho prašã!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Dej to sem všechno!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Ukaž mu!
	Ooh01						=	"SVM_8_Ooh01"					;//Poèkej!
	Ooh02						=	"SVM_8_Ooh02"					;//Dávej pozor!
	Ooh03						=	"SVM_8_Ooh03"					;//Au! To byla ale trefa!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_8_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Prý jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Prý jsi zašel za otcem Parlanem, aby ses vyzpovídal ze svých hâíchù.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Prý jsi zašel za Leem a dal ty vêci do poâádku.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Takhle vraždit naše ovce!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Nech mê na pokoji, ty špinavý zvíâe!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Nech mê na pokoji, ty mizernej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Jsi ostudou svého âádu! Poèkej, až se o tom dozví lord Hagen!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Jsi ostudou mêstských stráží! Poèkej, až se o tom dozví lord Andre!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Poèkej, až se o tom dozví lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Poèkej, až se o tom dozví otec Parlan!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Poèkej, až se to donese k Leeovi...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Poèkej, až se o tom dozví velitel Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Dobrá, dobrá, jsi lepší bojovník než já. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(arogantnê) Mám dojem, že už ti musí být jasné, kdo je tady ten silnêjší... Co chceš?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Mêl jsem dojem, že ses na mê pokoušel vytáhnout zbraà. To sis to rozmyslel? Ty spíš dáváš pâednost ROZHOVORU, co? (smích)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 zlatých.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...vážnê je to tak...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...to není to, co jsem slyšel...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...neâíkej mi, žes o tom nevêdêl...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...v tyhle dny ani nevíš, komu máš vêâit...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...všechno to jsou jen drby...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...nejsem o nic šãastnêjší...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...už mê nemùže nic pâekvapit...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...to vážnê není mùj problém...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...opravdu si myslíš, že...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...nikdo se ode mê nic nedozví...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...všem to bylo jasné...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...naslouchal špatným lidem...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...pokud to sám nevidí, nemùžu mu nijak pomoct...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...neâíkám ti nic nového...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...nikdy by na to sám nepâišel...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...to už se ví dlouho...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...to je špatný obchod...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...mêl jsem to udêlat jinak...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...úplnê s tebou souhlasím...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...nic nezmêní...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...nikdy by mê nenapadlo, že...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...není nic, co s tím mohl dêlat...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...to mê nijak nepâekvapuje...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...ale to ne, on vêdêl všechno nejlíp...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...situace je vážná, tak mi neâíkej, že...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...ještê ani nevêdêl, jak poâádnê držet meè...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...jo, vážnê âekl, že...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...za tohle bude muset nêkdo zaplatit...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos nenechá v nevêdomosti nikoho, kdo rozpozná jeho moudrost...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...spravedlnost nakonec zvítêzí...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Už tê nemùžu nauèit nic dalšího. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_8_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_8_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_8_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_8_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_8_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Nevêâím ti. Je na tobê nêco divnýho, nebo jsi divnê obleèenej.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Ty snad patâíš nêkam jinam, ne? Aspoà podle toho, co máš na sobê. Takhle s tebou nechci nic mít.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Musíme trochu vypadat, takže si koukej oblíct zbroj.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos žádá, abychom stále hrdê nosili jeho roucho. Takže se pâevleè.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//S kopáèi se nebavím. Dyk tu chodíš beze zbroje!

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Ty špinavej bandito!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIRÁTI!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_9_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Tak jsem tê pâece dostal!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Nikdy jsi sem nemêl chodit!
	DieMonster					=	"SVM_9_DieMonster"					;//Pojë sem, ty špinavèe!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//A další z têch šmejdù!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Už je tu další z têch hnusnejch potvor!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_9_HandsOff"					;//Dej ty špinavý pracky pryè!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Nech naše ovce na pokoji!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Pakuj se od našich ovcí, ty zatracený zvíâe!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Toho budeš litovat!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Varoval jsem tê!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Âekl jsem VEN!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hej! Co to tam provádíš?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Pâestaà! Hned teë!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Zapíchnu tê, bastarde!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//Tohle je pro tebe.
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Tumáš, ty hnusná bestie!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//O další potvoru míà!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Varuju tê! Už to víckrát nezkoušej, ty mizernej zlodêji!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//A už se k našim ovcím nepâibližuj!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//Ta je ale zatracenê tupá stvùra!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Neopovažuj se na mê znovu zaútoèit!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Varoval jsem tê!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Nechci tê tady už víckrát vidêt. Je to jasný?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Nechci tady žádné rvaèky, tak na to nezapomeà!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Nezkoušej žádné hlouposti!
	RunAway						= 	"SVM_9_RunAway"						;//Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//POPLACH!
	Guards						=	"SVM_9_Guards"					;//STRÁŽE!
	Help						=	"SVM_9_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(volá) Pošli ty bestie do vêèných lovišã!
	GoodKill					= 	"SVM_9_GoodKill"				;//(volá) Jo, nandej to tomu bastardovi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(kâièí) Dostanu tê!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Tady nemáš co dêlat!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Jo, vypadni odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Co máš za lubem? Co tady kolem èmucháš?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(vstává) Sakra, co chceš?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Dobrá, když už nic jiného, alespoà máš u sebe nêjaké zlato.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Ani zlaãák - hmpf.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Asi si vezmu tvoji zbraà.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(varovnê) Tak tohle už, hochu, víckrát nedêlej!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(agresivnê) Potâebuješ další nakládaèku?
	StopMagic					=	"SVM_9_StopMagic"				;//Pâestaà s têmi kouzly!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Poslední varování! Pâestaà s têmi kouzly!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Schovej tu zbraà, nebo v tom seš až po uši!
	WiseMove					=	"SVM_9_WiseMove"				;//Hej, ty nejsi tak blbej, jak vypadáš!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(pro sebe) Tohle už nikdy nezkoušej.
	OhMyHead					=	"SVM_9_OhMyHead"				;//(pro sebe) Ó! Moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(dychtivê) Aã je koneènê nêjaká zábava.
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(vydêšenê) Ó mùj bože...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(zlý smích) Aã si z toho vezme ponauèení.
	NotBad						= 	"SVM_9_NotBad"					;//(souhlasnê) To byla trefa!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(pro sebe) Takový surovec!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Dej mu!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Teë nepâestávej!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_9_Ooh01"					;//Dávej pozor!
	Ooh02						=	"SVM_9_Ooh02"					;//Tak mu to vraã!
	Ooh03						=	"SVM_9_Ooh03"					;//Do hajzlu, taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_9_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Tak velitel dal ty vêci do poâádku.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Tak tê otec Parlan zbavil viny.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Tak ses setkal s Leem a urovnal tu záležitost.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Dobrá.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Ty vraždíš ovce? Pâedpokládám, že se ti nepodaâilo najít nikoho bezbrannêjšího?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//S odpornejma banditama nechci nic mít!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Se zlodêji nechci mít nic spoleèného!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//Tak ty se chceš stát paladinem? Poèkej, až co na to âekne lord Hagen!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Vážnê se chceš stát èlenem mêstských stráží? Lord Andre tê v tom nehodlá podpoâit!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Zajdi za lordem Andrem, dokud mùžeš.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Zajdi za otcem Parlanem. Pomùže ti odèinit tvé hâíchy!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee se o tomhle dozví a ty za to zaplatíš.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Velitel Garond z toho nebude nadšený. Udêláš líp, když mu o tom âekneš dâív, než se situace ještê zhorší!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Dobrá, vyhrál jsi. Tak co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(arogantnê) Mám dojem, že už ti došlo, kdo tady má navrch. Co chceš?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//Zase ty? Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 zlatých.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...nemùžu tomu uvêâit...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...nebyl bych si tak jistý...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...ale on ví, že všichni...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...stêží vím, komu mám vêâit...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...nevím, co ho tak rozrušilo...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...už tak jsem v poâádný bryndê...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...zaslechl jsem jednu, dvê zvêsti...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...nezajímá mê, že...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...nesmíš vêâit všemu, co slyšíš...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...to nemá ode mê...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...už jsem o tom dost pâemýšlel...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...nikdo se mê neptal na názor...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...vážnê si nezasloužil, aby...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...neâíkej, žes nevêdêl, že...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...to bylo jasný...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...tak kde jsi k tomu teda pâišel...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...mám na to svùj názor...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...bylo to pâesnê tak, jak jsi âíkal...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...nevêâím tomu, že by se to mohlo zmênit...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...to je poprvé, co o tom slyším...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...mùžeme leda èekat, co se stane...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...vêdêl jsem, že nás èekají problémy...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...tak proè mê neposlouchal...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...bêžel, jako by mu byl v patách samotný Beliar...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...jasnê že jsme nakonec dostali...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...mêl bys do toho zasáhnout a situaci vyâešit...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...jeden nikdy neví, jak podlí mohou být...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...protože je to vùle Innosova...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...jeho skutky byly jen...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mùžu nauèit.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Není nic, co bych tê mohl ještê nauèit. Žák pâedèil svého uèitele.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_9_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_9_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_9_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_9_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_9_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš od kovárny dostat na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Ty máš ale ránu! Oblíkni si nêco vhodnêjšího!
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//Co to máš na sobê? Aã už tê tu vidím ve zbroji!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Pracuješ pro krále, tak koukej nosit jeho zbroj! Bêž se pâevlíct!
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Tvé šaty se pro èlena našeho âádu nehodí. Bêž se pâevléci!
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sobê nemáš ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//Jsi na âadê, bandito!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Sem jsi nemêl chodit, piráte!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_10_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//Už zase TY!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Rozsekám tê na kousky!
	DieMonster					=	"SVM_10_DieMonster"					;//Další z têch vêcí!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Ty mizernej zlodêji!
	HandsOff					=	"SVM_10_HandsOff"					;//Dej ty špinavý pracky pryè!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hej! Nech naše ovce na pokoji!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Ta obluda vraždí naše ovce!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//Co tam ta bestie provádí?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//Sám sis o to âekl!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Âekl sis o to.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Mám dojem, že by nêkterým lidem neuškodilo, kdyby poznali trochu tvrdosti.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Co tam dêláš, co!?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Chcípni!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Takovej blbej bastard...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//Dobrá, to na tebe bylo trochu moc, co, ty mizerná bestie!
	ThiefDown					=	"SVM_10_ThiefDown"					;//Pâestaà strkat nos do mých vêcí - jasný?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Hlídej si ty svoje ukoptêný prsty!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Okamžitê dej ty svoje umounêný pracky pryè od našich ovcí!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Chcípni, ty vrahu!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//Ta je ale zatracenê tupá stvùra!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Tohle už víckrát nezkoušej, kámo!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Doufám, že sis z toho vzal ponauèení.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Vstávej a vypadni odsud!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Aã už tê tu nikdy nevidím - jasný?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Já jsem ten, kdo tady rozdává rány, rozumíš?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_10_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//POPLACH!
	Guards						=	"SVM_10_Guards"					;//STRÁŽE!
	Help						=	"SVM_10_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(volá) Jo! Takhle se na to musí!
	GoodKill					= 	"SVM_10_GoodKill"				;//(volá) To je to, co si ta svinê zaslouží!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(kâièí) Ještê se uvidíme!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Ven!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Co tady chceš?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Jo, dej mu!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Co tady kolem èmucháš?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(vstává) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Ty mizernej bídáku - nemáš u sebe žádné zlato!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Asi si tuhle zbraà radêji vezmu!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(varovnê) Poslouchej! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(agresivnê) Koleduješ si!
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Chceš nakládaèku? Pâestaà s tím už!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Tak dej už tu zatracenou zbraà pryè!
	WiseMove					=	"SVM_10_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(pro sebe) Uvidíme pâíštê.
	OhMyHead					=	"SVM_10_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(nedoèkavê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(zlý smích) Dal jsi jim co proto!
	NotBad						= 	"SVM_10_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková krutost...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Jo, nandej mu to!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Ukaž mu!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_10_Ooh01"					;//Braà se!
	Ooh02						=	"SVM_10_Ooh02"					;//Pokraèuj, vraã mu to!
	Ooh03						=	"SVM_10_Ooh03"					;//Au! Taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(pro sebe, vstává) Sakra, co bylo zas TOHLE?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Vypadni z mé postele!
	Awake						= "SVM_10_Awake"						;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Tak velitel dal ty vêci do poâádku.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Tak jsi uèinil pokání u otce Parlana.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Slyšel jsem, že Lee dal ty vêci do poâádku.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//To je spravedlivé.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Vraždêní ovcí už bylo dost! Ztraã se!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Jsi grázl - ztraã se!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Zatracenej zlodêji! Už tê mám právê tak dost!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Od paladina bych oèekával nêco jiného! To se nebude lordu Hagenovi líbit.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Jak se nêkdo jako ty mohl dostat k mêstským strážím? Lord Andre ti to ještê spoèítá!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre se o tvém chování dozví!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Otec Parlan nebude mít z tvého poèínání žádnou radost!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Lee to nenechá jen tak!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Velitel Garond nebude mít radost, až to uslyší - za to zaplatíš!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Máš docela sílu... co že jsi to chtêl?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(domýšlivê) Nêjaké další otázky?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//Už zase TY!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 zlatých.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...je mi to jedno...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...nikdo to nechce vêdêt...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...bylo to jeho rozhodnutí, nebo ne...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...žádný návrh, âekni...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...nemám s tím nic spoleèného...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...nemám na takové vêci èas...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...nemùžu se z toho jen tak vyvlíknout...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...nebudeš mi âíkat...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...byl tam, udêlal to...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...vêci, o kterých ti mùžu âíct...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...na to se nemùžeš spoléhat...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...já to âíkal už dávno...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...a je toho víc, vêâ mi...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...nêkteré vêci se vrací v plné míâe...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...âekni, že to není pravda...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...dâíve èi pozdêji by k tomu došlo...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...vážnê o tom mêl vêdêt víc...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...to už nic nezmêní...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...není to žádné tajemství...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...není to žádný velký obchod...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...myslel si, že je to snadné jak...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...nikdo ve skuteènosti nechce slyšet...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...a to je pravda...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...staèí poslouchat, co âíkají...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...kdyby nebylo nás, dopadlo by to jinak...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...prostê potâebuje víc zkušeností...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...co on ví o službê...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Innos vymêâí spravedlivý trest...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...cesta poctivosti je dlouhá a trnitá...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...pouze Innos rozhodne, co je správné a co ne...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_10_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_10_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_10_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_10_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_10_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Co to máš na sobê? Víš, jak vypadáš? Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Jestli patâíš k nám, mêl by ses podle toho i oblíkat. Tak si na sebe vem nêco lepšího!
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Když ti nêkdo dá královskou zbroj, znamená to, že ji máš nosit.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Pokud odmítneš naše roucho, odmítáš tím i Innose. Zamysli se nad tím.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Proè bych se mêl bavit s nêkým, kdo nemá ani na poâádnou zbroj?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Ty odpornej bandito!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Ty hnusnej piráte!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(volá) Poèkej!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_11_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Tak jsem tê pâece jen dostal!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Sám sis o to âekl!
	DieMonster					=	"SVM_11_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_11_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_11_SheepKiller"					;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Tak to tê odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Tak co jsi tam teda dêlal, no!?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Trochu velký sousto, co, ty bâídile!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš? Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_11_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//POPLACH!
	Guards						=	"SVM_11_Guards"						;//STRÁŽE!
	Help						=	"SVM_11_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_11_GoodKill"					;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(hlasitê kâièí) Hej, stùj, ty špinavèe!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro zaèátek.
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Ty u sebe nemáš žádné zlato?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(varovnê) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(agresivnê) Ještê nemáš dost?
	StopMagic					=	"SVM_11_StopMagic"					;//Nepâibližuj se ke mnê s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Pâestaà s tou magií! Máš snad nêco s ušima!?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Seš snad hluchej, nebo co? Âekl jsem: Dej pryè tu zbraà!
	WiseMove					=	"SVM_11_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(pro sebe) Ještê se uvidí.
	OhMyHead					=	"SVM_11_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(dychtivê) Koneènê se nêco dêje!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(vystrašenê) Vymlátí si navzájem mozky z hlavy.
	GoodVictory					=	"SVM_11_GoodVictory"					;//(zlý smích) Koledoval si o to!
	NotBad						= 	"SVM_11_NotBad"						;//(souhlasnê) To nebylo vùbec špatné.
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(pro sebe) Takový surovec...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Tak na co èekáš?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//Výbornê!
	Ooh01						=	"SVM_11_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_11_Ooh02"						;//Ukaž mu, kdo je tady šéf!
	Ooh03						=	"SVM_11_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Vypadni z mé postele!
	Awake						= "SVM_11_Awake"							;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Slyšel jsem, že jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Slyšel jsem, že jsi zašel za otcem Parlanem a vyzpovídal ses mu ze svých hâíchù.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Âíká se, že jsi zašel za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Takhle vraždit naše ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//S mizernejma grázlama se nebavim!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Jdi mi z oèí, ty špinavej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Jsi ostudou svého âádu! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Jsi ostudou mêstských stráží! Lord Andre tê ještê nauèí zpùsobùm!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre se dozví o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Otec Parlan o tom neuslyší rád!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee ti dá co proto! Ještê uvidíš, co sis nadrobil!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Velitel Garond po tobê bude chtít vysvêtlení!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Tak dobrá, dobrá, vyhrál jsi. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(nafoukanê) Mám ti znovu ukázat, kdo je tady pánem?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 zlatých.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 zlatých.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 zlatých.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 zlatých.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 zlatých.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 zlatých.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 zlatých.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 zlatých.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 zlatých.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 zlatých.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 zlatých.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 zlatých.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 zlatých.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 zlatých.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 zlatých.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 zlatých.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 zlatých.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 zlatých.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 zlatých.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 zlatých.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 zlatých.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 zlatých.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 zlatých.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 zlatých.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 zlatých.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 zlatých.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 zlatých.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//...vážnê si myslíš...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//...všechno je možné...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//...mêl si to rozmyslet...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//...jako bych už tak nemêl dost problémù...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//...kdo ti to âekl...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//...z toho budou jen další problémy...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//...drbalo se tam o všem možném...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//...nemêl jsem to dêlat...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//...to všechno jsou jen âeèi...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//...radêji bys mêl zjistit, kdo to âíkal...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//...chtêl jsem ti to âíct dâív...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//...nikdo se mê neptal...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//...mêl bys mít soucit s chudákem...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//...to není nic nového...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//...je to úplnê jasné...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//...nemêl ses mê ptát, co...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//...však víš, co myslím...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//...je to pâesnê tak, jak jsem âíkal...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//...to už nic nezmêní...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//...proè mi o tom nikdo neâekl dâív...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//...poèkejme a uvidíme, co se stane...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//...nêkteré problémy se vyâeší samy...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//...už o tom nechci nic slyšet...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//...zaèal pít...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//...všichni utekli jak vyplašení králíci, zùstal jsem úplnê sám...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//...tak stojí v Písmu...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//...vždycky jsem konal ve jménu Innose...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//...nikdo se nesmí protivit vùli bohù...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_11_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_11_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_11_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_11_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_11_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Co to máš na sobê? Vùbec se k tobê nehodí. Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Jestli se mnou chceš mluvit, tak si laskavê oblíkni zbroj. Tak hejbni kostrou!
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Máš nosit královskou zbroj. Bêž pryè.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Nêco takového by èlen našeho âádu nosit nemêl. Bêž se pâevléknout.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Dyk na sobê nemáš ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Další bandita.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIRÁTI!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_12_Weather"					;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Tak jsem tê pâece dostal!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Nikdy jsi sem nemêl chodit!
	DieMonster					=	"SVM_12_DieMonster"					;//Pojë sem, ty špinavèe!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_12_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Nech naše ovce na pokoji!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Pakuj se od našich ovcí, ty zatracený zvíâe!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Toho budeš litovat!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Varoval jsem tê!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Âekl jsem VEN!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hej! Co to tam provádíš?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Pâestaà! Hned teë!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Zapíchnu tê, bastarde!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Tohle je pro tebe.
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//Tohle svinstvo miluju!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//O další potvoru míà!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Varuju tê! Už to víckrát nezkoušej, ty mizernej zlodêji!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//A už se k našim ovcím nepâibližuj!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Ta je ale zatracenê tupá stvùra!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Neopovažuj se na mê znovu zaútoèit!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Varoval jsem tê!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Už tê tady nechci víckrát vidêt, jasný?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Nechci tady žádné rvaèky, tak na to nezapomeà!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Nezkoušej žádné hlouposti!
	RunAway						= 	"SVM_12_RunAway"						;//Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//POPLACH!
	Guards						=	"SVM_12_Guards"					;//STRÁŽE!
	Help						=	"SVM_12_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(volá) Pošli ty bestie do vêèných lovišã!
	GoodKill					= 	"SVM_12_GoodKill"				;//(volá) Jo, nandej to tomu bastardovi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(kâièí) Dostanu tê!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Tady nemáš co dêlat!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Jo, vypadni odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Co máš za lubem? Co tady kolem èmucháš?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(vstává) Sakra, co chceš?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Dobrá, když už nic jiného, alespoà máš u sebe nêjaké zlato.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Ani zlaãák - hmpf.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Asi si vezmu tvoji zbraà.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(varovnê) Tak tohle už, hochu, víckrát nedêlej!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(agresivnê) Potâebuješ další nakládaèku?
	StopMagic					=	"SVM_12_StopMagic"				;//Pâestaà s têmi kouzly!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Poslední varování! Pâestaà s têmi kouzly!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Schovej tu zbraà, nebo v tom seš až po uši!
	WiseMove					=	"SVM_12_WiseMove"				;//Hej, ty nejsi tak blbej, jak vypadáš!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(pro sebe) Tohle už nikdy nezkoušej.
	OhMyHead					=	"SVM_12_OhMyHead"				;//(pro sebe) Ó! Moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(dychtivê) Aã je koneènê nêjaká zábava.
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(vystrašenê) Ó, mùj bože...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(zlý smích) Aã si z toho vezme ponauèení.
	NotBad						= 	"SVM_12_NotBad"					;//(souhlasnê) To byla trefa!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(pro sebe) Takový surovec!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Dej mu!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Teë nepâestávej!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_12_Ooh01"					;//Dávej pozor!
	Ooh02						=	"SVM_12_Ooh02"					;//Tak mu to vraã!
	Ooh03						=	"SVM_12_Ooh03"					;//Do hajzlu, taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_12_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Tak velitel dal ty vêci do poâádku.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Tak tê otec Parlan zbavil viny.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Tak ses setkal s Leem a urovnal tu záležitost.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Dobrá.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Ty vraždíš ovce? Pâedpokládám, že se ti nepodaâilo najít nikoho bezbrannêjšího?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//S odpornejma banditama nechci nic mít!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Se zlodêji nechci mít nic spoleèného!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//Tak ty se chceš stát paladinem? Poèkej, až co na to âekne lord Hagen!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Vážnê se chceš stát èlenem mêstských stráží? Lord Andre tê v tom nehodlá podpoâit!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Zajdi za lordem Andrem, dokud mùžeš.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Zajdi za otcem Parlanem. Pomùže ti odèinit tvé hâíchy!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee se o tomhle dozví a ty za to zaplatíš.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Velitel Garond z toho nebude nadšený. Udêláš líp, když mu o tom âekneš dâív, než se situace ještê zhorší!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Dobrá, vyhrál jsi. Tak co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(arogantnê) Mám dojem, že už ti došlo, kdo tady má navrch. Co chceš?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//Zase ty? Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 zlatých.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//...je mi to jedno...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//...nikdo to nechce vêdêt...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//...bylo to jeho rozhodnutí, nebo ne...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//...žádný návrh, âekni...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//...nemám s tím nic spoleèného...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//...nemám na takové vêci èas...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//...nemùžu se z toho jen tak vyvlíknout...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//...nebudeš mi âíkat...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//...byl tam, udêlal to...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//...vêci, o kterých ti mùžu âíct...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//...na to se nemùžeš spoléhat...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//...já to âíkal už dávno...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//...a je toho víc, vêâ mi...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//...nêkteré vêci se vrací v plné míâe...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//...âekni, že to není pravda...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//...dâíve èi pozdêji by k tomu došlo...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//...mêl toho vêdêt víc...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//...to už nic nezmêní...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//...není to žádné tajemství...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//...není to žádný velký obchod...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//...myslel si, že je to snadné jak...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//...nikdo ve skuteènosti nechce slyšet...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//...a to je pravda...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...prostê poslouchej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//...kdyby nebylo nás, dopadlo by to jinak...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//...prostê potâebuje víc zkušeností...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//...co on ví o službê...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//...Innos vymêâí spravedlivý trest...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//...cesta poctivosti je dlouhá a trnitá...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//...pouze Innos rozhodne, co je správné a co ne...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_12_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_12_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_12_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_12_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_12_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Napâed se pâevleè, takhle ti to stejnê nesluší.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Jestli se mnou chceš mluvit, oblékni si zbroj.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Voják má nosit jedinê královskou zbroj, NIC JINÉHO! Tak se mazej pâevlíknout!
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Nêco takového by èlen našeho âádu nosit nemêl. Bêž se pâevléknout.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Se slabochy se nebavím. To nemáš ani na brnêní?

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Rozsekám tê na kousíèky, bandito!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Rozsekám tê na kousíèky, piráte!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_13_Weather"					;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Dostanu tê!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Rozsekám tê na kousky!
	DieMonster					=	"SVM_13_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_13_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_13_SheepKiller"				;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Ty chceš zdrhnout? Tak dobrá!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Cos tam pohledával?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Zasloužil sis to, nièemo!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš?! Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Neubližuj mi!
	RunAway						= 	"SVM_13_RunAway"					;//A do hajzlu!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//POPLACH!
	Guards						=	"SVM_13_Guards"					;//STRÁŽE!
	Help						=	"SVM_13_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_13_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(kâièí) Jo! Utíkej, jak nejrychleji mùžeš!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Ještê poâád nemáš dost?
	StopMagic					=	"SVM_13_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Chceš napráskat? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_13_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_13_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(dychtivê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(zlý smích) Ukázals mu, kdo je tady pánem!
	NotBad						= 	"SVM_13_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková krutost...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Tak ho prašã!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Dej to sem všechno!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Ukaž mu!
	Ooh01						=	"SVM_13_Ooh01"					;//Poèkej!
	Ooh02						=	"SVM_13_Ooh02"					;//Dávej pozor!
	Ooh03						=	"SVM_13_Ooh03"					;//Jó! To byla trefa!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_13_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Prý jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Prý jsi zašel za otcem Parlanem, aby ses vyzpovídal ze svých hâíchù.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Prý jsi zašel za Leem a dal ty vêci do poâádku.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Takhle vraždit naše ovce!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Nech mê na pokoji, ty špinavý zvíâe!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Nech mê na pokoji, ty mizernej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Jsi ostudou svého âádu! Poèkej, až se o tom dozví lord Hagen!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Jsi ostudou mêstských stráží! Poèkej, až se o tom dozví lord Andre!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Poèkej, až se o tom dozví lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Poèkej, až se o tom dozví otec Parlan!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Poèkej, až se to donese k Leeovi...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Poèkej, až se o tom dozví velitel Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Dobrá, dobrá, jsi lepší bojovník než já. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(arogantnê) Mám dojem, že už ti musí být jasné, kdo je tady ten silnêjší... Co chceš?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Mêl jsem dojem, že ses na mê pokoušel vytáhnout zbraà. To sis to rozmyslel? Ty spíš dáváš pâednost ROZHOVORU, co? (smích)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 zlatých.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...je mi to jedno...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...nikdo to nechce vêdêt...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...bylo to jeho rozhodnutí, nebo ne...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...žádný návrh, âekni...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...nemám s tím nic spoleèného...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...nemám na takové vêci èas...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...nemùžu se z toho jen tak vyvlíknout...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...nebudeš mi âíkat...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...byl tam, udêlal to...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...vêci, o kterých ti mùžu âíct...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...na to se nemùžeš spoléhat...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...já to âíkal už dávno...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...a je toho víc, vêâ mi...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...nêkteré vêci se vrací v plné míâe...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...âekni, že to není pravda...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...dâíve èi pozdêji by k tomu došlo...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...vážnê o tom mêl vêdêt víc...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...to už nic nezmêní...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...není to žádné tajemství...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...není to žádný velký obchod...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...myslel si, že je to snadné jak...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...nikdo ve skuteènosti nechce slyšet...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...a to je pravda...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...prostê poslouchej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...kdyby nebylo nás, dopadlo by to jinak...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...prostê potâebuje víc zkušeností...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...co on ví o službê...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Innos vymêâí spravedlivý trest...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...cesta poctivosti je dlouhá a trnitá...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...pouze Innos rozhodne, co je správné a co ne...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_13_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_13_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_13_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_13_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_13_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Co to máš na sobê? Vùbec se to k tobê nehodí. Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Nemáš na sobê zbroj – bêž si ji vzít.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Mêl bys hrdê nosit královskou zbroj a nebêhat tu v takových hadrech! Odchod!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Proè nenosíš roucho našeho âádu? Bêž si o tom popâemýšlet!
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sobê nemáš ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Ty špinavej bandito!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Ty mizernej piráte!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_14_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//Tak jsem tê pâece jen dostal!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Sám sis o to âekl!
	DieMonster					=	"SVM_14_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_14_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_14_SheepKiller"					;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Tak to tê odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Tak co jsi tam teda dêlal, no!?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//Trochu velký sousto, co, ty bâídile!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//Už nikdy têma svýma prackama nesahej na vêci, co ti neâíkaj pane!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš? Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Prostê mê nech být!
	RunAway						= 	"SVM_14_RunAway"						;//Do hajzlu! Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//POPLACH!
	Guards						=	"SVM_14_Guards"						;//STRÁŽE!
	Help						=	"SVM_14_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(volá) Dobrá práce - o jednu špinavou bestii míà!
	GoodKill					= 	"SVM_14_GoodKill"					;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(hlasitê kâièí) Hej, stùj, ty špinavèe!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(probudí se) K èertu, co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro zaèátek.
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Ty u sebe nemáš žádné zlato?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(varovnê) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(agresivnê) Ještê nemáš dost?
	StopMagic					=	"SVM_14_StopMagic"					;//Nepâibližuj se ke mnê s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Pâestaà s tou magií! Máš snad nêco s ušima!?
	WeaponDown					=	"SVM_14_WeaponDown"					;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Copak jsi neslyšel? Âekl jsem: Dej pryè tu zbraà!
	WiseMove					=	"SVM_14_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(pro sebe) Ještê se uvidí.
	OhMyHead					=	"SVM_14_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(dychtivê) Koneènê se nêco dêje!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(vystrašenê) Vymlátí si navzájem mozky z hlavy.
	GoodVictory					=	"SVM_14_GoodVictory"					;//(zlý smích) Koledoval si o to!
	NotBad						= 	"SVM_14_NotBad"						;//(souhlasnê) To nebylo vùbec špatné.
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(pro sebe) Takový surovec...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Tak na co èekáš?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Výbornê!
	Ooh01						=	"SVM_14_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_14_Ooh02"						;//Ukaž mu, kdo je tady šéf!
	Ooh03						=	"SVM_14_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(pro sebe, vstává) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Vypadni z mé postele!
	Awake						= "SVM_14_Awake"							;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Slyšel jsem, že jsi zašel za velitelem a dal vêci do poâádku.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//Slyšel jsem, že jsi zašel za otcem Parlanem a vyzpovídal ses mu ze svých hâíchù.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Âíká se, že jsi zašel za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//To je dobâe.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Takhle vraždit naše ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//S mizernejma grázlama se nebavim!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Jdi mi z oèí, ty špinavej zlodêji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Jsi ostudou svého âádu! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Jsi ostudou mêstských stráží! Lord Andre tê ještê nauèí zpùsobùm!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre se dozví o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Otec Parlan o tom neuslyší rád!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Lee ti dá co proto! Ještê uvidíš, co sis nadrobil!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Velitel Garond po tobê bude chtít vysvêtlení!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Tak dobrá, dobrá, vyhrál jsi. Co chceš?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(nafoukanê) Mám ti znovu ukázat, kdo je tady pánem?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Zkoušíš to na mê znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 zlatých.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 zlatých.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 zlatých.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 zlatých.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 zlatých.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 zlatých.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 zlatých.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 zlatých.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 zlatých.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 zlatých.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 zlatých.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 zlatých.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 zlatých.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 zlatých.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 zlatých.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 zlatých.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 zlatých.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 zlatých.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 zlatých.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 zlatých.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 zlatých.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 zlatých.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 zlatých.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 zlatých.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 zlatých.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 zlatých.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 zlatých.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...nevêâím tomu...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...nebyl bych si tak jistý...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...ale on ví, že všichni...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...stêží vím, komu vêâit...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...nevím, co ho tak rozrušilo...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...už tak jsem v poâádný bryndê...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...zaslechl jsem jednu, dvê zvêsti...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...nezajímá mê, že...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...nesmíš vêâit všemu, co slyšíš...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...to nemá ode mê...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...už jsem o tom dost pâemýšlel...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...nikdo se mê neptal na názor...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...vážnê si nezasloužil, aby...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...neâíkej, žes nevêdêl, že...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...bylo to docela jasné...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...tak kde jsi k tomu teda pâišel...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...takhle to nemohlo jít vêènê...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...mám na to svùj vlastní názor...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...bylo to pâesnê tak, jak jsi âíkal...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...nevêâím tomu, že by se to mohlo zmênit...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...to bylo poprvé, co jsem o tom slyšel...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...prostê poèkáme a uvidíme...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...vêdêl jsem, že nás èekají problémy...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...tak proè mê neposlouchal...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...bêžel, jako by mu byl v patách samotný Beliar...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...jasnê že jsme nakonec dostali...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...mêl bys do toho zasáhnout a situaci vyâešit...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...jeden nikdy neví, jak podlí mohou být...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...protože je to vùle Innosova...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...jeho skutky byly jen...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_14_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_14_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_14_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_14_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_14_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Tyhle šaty se k tobê nehodí, urèitê pâede mnou nêco tajíš. Nech mê být.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Jestli se mnou chceš mluvit, oblíkni si zbroj.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Buë hrdý na armádu, ke které patâíš, a necourej se tu v takových hadrech. Bêž se pâevlíct!
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Nêco takového by èlen našeho âádu nosit nemêl. Bêž se pâevléknout.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sobê nemáš ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Chcípni, bandito!
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Chcípni, piráte!
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
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Poèkej chvilku!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nefunguje.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, je to znièené.
	NeedKey					= 	"SVM_15_NeedKey"					;//Na to potâebuju klíè...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Žádné další paklíèe...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//O páèení zámkù nevím vùbec nic.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Prohledání všech pokojù bude trvat vêènost!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm... Nemám ani klíè, ani paklíè.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Tohle nemùžu bez správného klíèe nikdy odemknout!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Hodilo by se pár paklíèù!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Tuhle vêc se mi nikdy nepodaâí odemknout!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Co s tím?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hmm... Ne...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Nic, co by stálo za to.
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nic tu není.
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nic, co by se dalo sebrat.
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargh
	Awake					=	"SVM_15_Awake"						;//(probudí se)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Mmh. Tak to je místo, kde se schováváš. Je to zatracenê daleko. Mmh. Budu potâebovat loë, abych se tam dostal.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innosi, pomoz mi a oèisti tuto svatyni.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innosi, pomoz mi a tak vùbec... Tak. To už by mêlo být naposled.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ach. Kniha se otevâela. Uvnitâ je schovaný dopis a klíè.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Otevâi se!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Pojëme obchodovat.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Ukaž mi své zboží.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Ukaž mi, co máš na skladê.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Chápu.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Á, myslím, že jsem nêco našel.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Nerozumím tomu.
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Tohle nepâeètu!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(kašel) No teda! Brrrr!
	HUI						=	"SVM_15_Addon_HUI"						;//Oh, oh, oh!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Co víš o tom pokusu zabít Estebana?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//K tomu útoku na Estebana...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Pobil jsem ty zrádce.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Hledám ty chlapy, abych mohl vytáhnout proti Estebanovi.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Potâebují tê v dole.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Zjev se mi, Quarhodrone, pradávný veliteli váleènické kasty!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Hmm, tady to nefunguje.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Co bych mêl vêdêt o dolování zlata?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Ahá, Francisova úèetní kniha. Ten chlap si koukám z cizího zlata pêknê namastil vlastní kapsu.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_16_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//Tak jsem tê pâece jen dostal!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Sám sis o to âekl!
	DieMonster					=	"SVM_16_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_16_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_16_SheepKiller"					;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Tak to tê odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Tak co jsi tam teda dêlal, no?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//Trochu velký sousto, co, ty bâídile!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//Pâestaà têma svýma prackama šmatat na vêci, který ti nepatâej!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš?! Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Neubližuj mi!
	RunAway						= 	"SVM_16_RunAway"						;//Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//POPLACH!
	Guards						=	"SVM_16_Guards"					;//STRÁŽE!
	Help						=	"SVM_16_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(volá) Dobrá práce!
	GoodKill					= 	"SVM_16_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(volá) Stùj, babo!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(vstává) Co se dêje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Ještê poâád nemáš dost?
	StopMagic					=	"SVM_16_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Chceš do zubù? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_16_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_16_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(nedoèkavê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(zlý smích) Ukázals mu, kdo je tady pánem!
	NotBad						= 	"SVM_16_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková surovost...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Prašã ho!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Dej mu co proto!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Jen mu to nandej!
	Ooh01						=	"SVM_16_Ooh01"					;//Vraã mu to!
	Ooh02						=	"SVM_16_Ooh02"					;//Tak bacha!
	Ooh03						=	"SVM_16_Ooh03"					;//Au! Taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(pro sebe, vstává) Co bylo zase TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_16_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Tak jsi zašel za velitelem a oèistil své jméno.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Tak jsi zašel za otcem Parlanem a odèinil své hâíchy.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee dal ty vêci do poâádku.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//To je dobâe.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Nemùžeš prostê takhle zabíjet naše ovce! Padej odsud!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Jsi sprostej bandita, nechci s tebou nic mít.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Se zlodêji nemluvím - a teë zmizni!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Nezachoval ses èestnê. Lordu Hagenovi se to nebude líbit!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Tvé chování je ostudou mêstských stráží! Lord Andre po tobê bude chtít vysvêtlení!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre se dozví o tom, cos provedl!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Zachoval ses špatnê. Jdi za otcem Parlanem a kaj se.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee se dozví o tom, cos provedl - a trestu se nevyhneš!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Velitel Garond po tobê bude chtít vysvêtlení!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 zlatých.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...vážnê? Zajímavé...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...tomu nevêâím...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...tak to mùj manžel nemyslel...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...jdi pryè, neâíkej mi, že...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...pâísahám, vidêl jsem to na vlastní oèi...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...neâíkej...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...nikomu o tom ani muk...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...jsou to teë têžké èasy...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...kdo âíká nêco takového?...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...kdybych to nevidêl na vlastní oèi...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...nêkdo by mêl tu práci udêlat...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...to není to, co jsem slyšel...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...teë je to bêžné, nebo ne...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...sám nedosáhne nièeho...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...udêlal by líp, kdyby držel zobák...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...a pracuje celé dny, pâíliš...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...nemùžu se starat o všechno...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...prostê toho moc nakecá...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...je to veâejné tajemství...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...všichni to teë vêdí...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...odteë už jí neâeknu ani slovo...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...a bude to ještê horší...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...ale to je strašné...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...to jsem vždycky âíkal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_16_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_16_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_16_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_16_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_16_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Oblíkni si nêco slušnýho, takhle se na tebe nemùžu koukat.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//BANDITA!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//PIRÁT!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Za krále!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_17_Weather"						;//Zatracená slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//Tak jsem tê pâece jen dostal!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Sám sis o to âekl!
	DieMonster					=	"SVM_17_DieMonster"					;//Támhle je další z têch neâádù!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Mizernej zlodêji! Jen poèkej!
	HandsOff					=	"SVM_17_HandsOff"					;//Dej ty svý špinavý pracky pryè!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Ten kýbl hnusu vraždí naše ovce!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Ta mizerná zrùda se cpe našima ovcema!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Sem žádný bestie nesmêj!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Jen poèkej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Âekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Tak to tê odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Tak co jsi tam teda dêlal, no!?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Tak pâestaneš s tím už?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Chcípni, grázle!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//Trochu velký sousto, co, ty bâídile!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//O jednu zrùdu míà!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Už se mê nikdy nepokoušej okrást!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//Pâestaà têma svýma prackama šmatat na vêci, který ti nepatâej!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Tohle už nikdy nedêlej! To jsou naše ovce!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Chcípni, grázle!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//To je ale zatracenê hnusná zrùda!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Už na mê nikdy nevytahuj zbraà!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Mêl jsi mê poslechnout!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//A teë vypadni!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//A aã už tê tady víckrát nevidím!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Tady žádné rvaèky nestrpíme, rozumíš? Doufám, že ses z toho pouèil!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Neubližuj mi!
	RunAway						= 	"SVM_17_RunAway"						;//Padám pryè!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//POPLACH!
	Guards						=	"SVM_17_Guards"					;//STRÁŽE!
	Help						=	"SVM_17_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(volá) Dobrá práce!
	GoodKill					= 	"SVM_17_GoodKill"				;//(volá) Jo, dej tý svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Nech mê být!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(volá) Stùj, babo!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Co tady chceš!? Padej!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hej ty! Co tady èmucháš kolem?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(vstává) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Díky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Ty mizernej všiváku, nemáš u sebe žádný zlato!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Mám dojem, že si tu tvou zbraà vezmu k sobê do úschovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(varovnê) Dávej si pozor! Ještê jednou a nêjakou ti vrazím.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Ještê poâád nemáš dost?
	StopMagic					=	"SVM_17_StopMagic"				;//Pâestaà s tím magickým svinstvem!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Chceš do zubù? Okamžitê s tím pâestaà!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Dej pryè tu zbraà!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Tak dáš tu zatracenou zbraà pryè?!
	WiseMove					=	"SVM_17_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(pro sebe) Dobrá, pâíštê se ukáže.
	OhMyHead					=	"SVM_17_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(nedoèkavê) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(vystrašenê) Božínku, boj!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(zlý smích) Ukázals mu, kdo je tady pánem!
	NotBad						= 	"SVM_17_NotBad"					;//(souhlasnê) To nebylo špatné.
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(pro sebe) Mùj bože! Taková surovost...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Prašã ho!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Dej mu co proto!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Jen mu to nandej!
	Ooh01						=	"SVM_17_Ooh01"					;//Vraã mu to!
	Ooh02						=	"SVM_17_Ooh02"					;//Tak bacha!
	Ooh03						=	"SVM_17_Ooh03"					;//Au! Taková pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(pro sebe, vstává) Co bylo zase TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Vypadni z mé postele!
	Awake						= "SVM_17_Awake"					;//(zívá od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Tak jsi zašel za velitelem a oèistil své jméno.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Tak jsi zašel za otcem Parlanem a odèinil své hâíchy.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee dal ty vêci do poâádku.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//To je dobâe.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Nemùžeš prostê takhle zabíjet naše ovce! Padej odsud!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Jsi sprostej bandita, nechci s tebou nic mít.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Se zlodêji nemluvím - a teë zmizni!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Nezachoval ses èestnê. Lordu Hagenovi se to nebude líbit!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Tvé chování je ostudou mêstských stráží! Lord Andre po tobê bude chtít vysvêtlení!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre se dozví o tom, cos provedl!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Zachoval ses špatnê. Jdi za otcem Parlanem a kaj se.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee se dozví o tom, cos provedl - a trestu se nevyhneš!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Velitel Garond po tobê bude chtít vysvêtlení!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 zlatých.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 zlatých.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 zlatých.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 zlatých.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 zlatých.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 zlatých.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 zlatých.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 zlatých.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 zlatých.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 zlatých.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 zlatých.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 zlatých.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 zlatých.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 zlatých.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 zlatých.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 zlatých.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 zlatých.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 zlatých.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 zlatých.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 zlatých.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 zlatých.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 zlatých.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 zlatých.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 zlatých.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 zlatých.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 zlatých.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 zlatých.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 zlatých.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...vážnê? Zajímavé...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...tomu nevêâím...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...tak to mùj manžel nemyslel...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...ale jdi, neâíkej mi, že...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...pâísahám, vidêl jsem to na vlastní oèi...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...neâíkej...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...nikomu o tom ani muk...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...jsou to teë têžké èasy...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...kdo âíká nêco takového?...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...kdybych to nevidêl na vlastní oèi...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...nêkdo by mêl tu práci udêlat...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...to není to, co jsem slyšel...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...teë je to bêžné, nebo ne...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...sám nedosáhne nièeho...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...udêlal by líp, kdyby držel zobák...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...a pracuje celé dny, pâíliš...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...nemùžu se starat o všechno...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...prostê toho moc nakecá...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...je to veâejné tajemství...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...všichni to teë vêdí...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...odteë už jí neâeknu ani slovo...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...a bude to ještê horší...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...ale to je strašné...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...to jsem vždycky âíkal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Vraã se, až získáš víc zkušeností.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Chceš po mnê víc, než tê mohu nauèit.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Už tê nemám co nauèit. Žák pâekonal svého uèitele.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Podívej, už teë jsi lepší.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Právê se nacházíš v dolní èásti mêsta.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Právê se nacházíš v horní èásti mêsta.
	TEMPEL						= "SVM_17_TEMPEL"					;//Právê se nacházíš na chrámovém námêstí.
	MARKT						= "SVM_17_MARKT"						;//Právê jsi na tržišti.
	GALGEN						= "SVM_17_GALGEN"					;//Právê se nacházíš na šibenièním námêstí, pâed kasárnami.
	KASERNE						= "SVM_17_KASERNE"					;//Tohle jsou kasárna.
	HAFEN						= "SVM_17_HAFEN"						;//Právê se nacházíš v pâístavní ètvrti.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Kam chceš jít?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Projdi vnitâní mêstskou branou a dostaneš se do dolní èásti mêsta.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Schodištê vede od jižní mêstské brány ke vnitâní mêstské bránê. Tam zaèíná horní èást mêsta.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Podchodem se mùžeš dostat od kovárny na chrámové námêstí.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Pokud pùjdeš po pâístavní ulici smêrem dolù, dostaneš se do pâístavu.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Máme tu podchod, který vede z chrámového námêstí do dolní èásti mêsta.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Až budeš pâed chrámem, pokraèuj doleva a podél hradeb. Tak se dostaneš na tržištê.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Pokud bys šel od chrámu a prošel kolem hospody, kterou budeš mít po levé ruce, vyjdeš na šibenièním námêstí.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Pokud pùjdeš od tržištê podél vysokých hradeb, dostaneš se ke chrámu.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Až mineš velká kasárna, dostaneš se na šibenièní námêstí.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Jdi ulièkou od šibenièního námêstí smêrem dolù a dostaneš se na chrámové námêstí.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Až mineš velká kasárna, dostaneš se na tržištê.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Ta obrovská budova jsou kasárna. Staèí vyjít nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Staèí sejít po schodech nalevo od hlavního vchodu a dostaneš se na tržištê.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Staèí sejít po schodech napravo od hlavního vchodu a dostaneš se na šibenièní námêstí.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Pokud se dáš pâístavní ulicí od pobâežní hráze, dostaneš se do dolní èásti mêsta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//Aaaaaargh!
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(zasyèí) Tady jsi!
	RunCoward    	= "SVM_19_RunCoward"    	;//(zasyèí) Dostaneme tê!
	Dead      		= "SVM_19_Dead"      	;//Aaaaaargh!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




