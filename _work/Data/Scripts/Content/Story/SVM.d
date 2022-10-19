// *********************
// Standard	Voice Module
// *********************

CLASS C_SVM
{
	// ------ B_Say_GuildGreetings ------
	var string MILGreetings;				//Miliz gr��t Miliz oer Paladin
	var string PALGreetings;				//Paladin gr��t Paladin oder Magier
	var string Weather;						//So ein Mistwetter!
	
	// ------ B_Say_AttackReason ------
	var string IGetYouStill;				//Upset-NSC sieht Spieler w�hrned seiner Angry-Time wieder. Greift mit altem AttackReason an.
	var string DieEnemy;					//Feind wird angegriffen
	var string DieMonster;					//gef�hrliches Monster wird angegriffen
	var string Addon_DieMonster;
	var string Addon_DieMonster2;
	var string DirtyThief;					//Dieb wird angegriffen
	var string HandsOff;					//SC fummelt an Objekt rum
	var string SheepKiller;					//Mensch greift Schaf an
	var string SheepKillerMonster;			//Monster greift Schaf an
	var string YouMurderer;					//Mensch hat Menschen umgebracht (kein Feind)
	var string DieStupidBeast;				//Torwachen schlagen ungef�hliches Monster tot, das versucht durchs Tor zu gehen	
	var string YouDareHitMe;				//SC hat NSC geschlagen
	var	string YouAskedForIt;				//SC hat trotz Aufforderung seine Waffe NICHT weggesteckt
	var string ThenIBeatYouOutOfHere;		//SC hat trotz Aufforderung Raum NICHT verlassen 
	var string WhatDidYouDoInThere;			//Wache sieht SC aus einem verbotenen Raum rauskommen und greift an
	var string WillYouStopFighting;			//Wache beendet Kampf, greift T�ter an
	
	// ------ B_Say_AttackEND ------
	var string KillEnemy;					//Finishing-Move
	var string EnemyKilled;					//NSC hat Feind get�tet
	var string MonsterKilled;				//NSC hat gef�hrliches Monster get�tet
	var string Addon_MonsterKilled;			
	var string Addon_MonsterKilled2;	
	var string ThiefDown;					//NSC hat Item-Dieb niedergeschlagen
	var string RumfummlerDown;				//NSC hat verbotenes-MOBSI-Benutzer niedergeschlagen
	var string SheepAttackerDown;			//NSC hat human SheepAttacker oder SheepKiller umgehauen
	var string KillMurderer;				//M�rder finishen
	var string StupidBeastKilled;			//GateGuards t�ten neutrales Monster, das vorbeikam
	var string NeverHitMeAgain;				//NSC hat jemand niedergeschlagen, der ihn angegriffen hat
	var string YouBetterShouldHaveListened;	//NSC hat jemed niedergeschlagen, der die Waffe nicht weggesteckt hat
	var string GetUpAndBeGone;				//NSC hat einen Eindringling im Portalraum niedergeschlagen
	var string NeverEnterRoomAgain;			//NSC hat Spieler, der aus verbotenem Portalraum kam niedergeschlagen
	var string ThereIsNoFightingHere;		//Wache hat T�ter einer Schl�gerei (derjenige, der angefangen hat) niedergeschlagen

	// ------ C_WantToFlee ------ 
	var string SpareMe;						//Tu mir nichts!
	var string RunAway;						//Schei�e! Nichts wie weg!		

	// ------ C_WantToCallGuardsForFight ------
	var	string Alarm;						//Wache ruft Wache
	var string Guards;						//Harter Bursche ruft Wache
	var string Help;						//B�rger ruft Hilfe
		
	// ------ B_AssessMurder ------
	var string GoodMonsterKill;				//Monster get�tet - NSC findet das toll
	var string GoodKill;					//Mensch get�tet - NSC findet das toll (war sein Feind)
	
	// ------ B_AssessTalk ------
	var string NOTNOW;						//wenn RefuseTalk Counter aktiv
	
	// ------ ZS_Attack ------
	var string RunCoward;					//Gegner flieht
	
	// ------ ZS_ClearRoom ------
	var string GetOutOfHere;				//Spieler in verbotenem Raum. Harter Bursche: Raus hier!
	var string WhyAreYouInHere;				//Spieler in verbotenem Raum. Weicher Bursche: Was willst du hier?
	var string YesGoOutOfHere;				//Spieler verl��t verboten Raum artig wieder

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
	var string OhMyGodItsAFight;			//NSC entdeckt einen Kampf, und findet das best�tzend (B�rger)
	var string GoodVictory;					//Dem Sieger zujubeln
	var string NotBad;						//'Nicht schlecht...' - Kampfende - Freund wurde von Nicht-Freund besiegt
	var string OhMyGodHesDown;				//Best�rzung �ber brutales Niederschlagen
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
	var string Awake;						//NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, r�keln)
	
	// ------ B_AssignAmbientNEWS ------
	var string ABS_COMMANDER;				//Ich h�rte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	var string ABS_MONASTERY;				//Ich h�rte, du warst bei Vater Parlan und hast Bu�e getan.
	var string ABS_FARM;					//Ich h�rte, du warst bei Lee und und hast die Sache wieder in Ordnung gebracht.
	var string ABS_GOOD;
	// ---------------------------------
	var string SHEEPKILLER_CRIME; 			//Einfach unsere Schafe zu schlachten! Mach, da� du hier wegkommst!
	var string ATTACK_CRIME;				//Mit miesen Schl�gern rede ich nicht!
	var string THEFT_CRIME;					//Geh mir aus den Augen, dreckiger Dieb!
	var string MURDER_CRIME;				//Mit gemeinen M�rdern rede ich nicht.
	// ---------------------------------
	var string PAL_CITY_CRIME; 				//Du bist eine Schande f�r deinen Orden! Lord Hagen wird toben vor Wut!
	var string MIL_CITY_CRIME;				//Du bist eine Schande f�r die Stadtwache! Lord Andre wird dir das sicher austreiben!
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
	var string GOLD_1000;					//1000 Goldst�cke.
	var string GOLD_950;					//950 Goldst�cke.
	var string GOLD_900;					//900 Goldst�cke.
	var string GOLD_850;					//850 Goldst�cke.
	var string GOLD_800;					//800 Goldst�cke.
	var string GOLD_750;					//750 Goldst�cke.
	var string GOLD_700;					//700 Goldst�cke.
	var string GOLD_650;					//650 Goldst�cke.
	var string GOLD_600;					//600 GOldst�cke.
	var string GOLD_550;					//550 Goldst�cke.
	var string GOLD_500;					//500 Goldst�cke.
	var string GOLD_450;					//450 Goldst�cke.
	var string GOLD_400;					//400 Goldst�cke.
	var string GOLD_350;					//350 Goldst�cke.
	var string GOLD_300;					//300 Goldst�cke.
	var string GOLD_250;					//250 Goldst�cke.
	var string GOLD_200;					//200 Goldst�cke.
	var string GOLD_150;					//150 Goldst�cke.
	var string GOLD_100;					//100 Goldst�cke.
	var string GOLD_90;						//90 Goldst�cke.
	var string GOLD_80;						//80 Goldst�cke.
	var string GOLD_70;						//70 Goldst�cke.
	var string GOLD_60;						//60 Goldst�cke.
	var string GOLD_50;						//50 Goldst�cke.
	var string GOLD_40;						//40 Goldst�cke.
	var string GOLD_30;						//30 Goldst�cke.
	var string GOLD_20;						//20 Goldst�cke.
	var string GOLD_10;						//10 Goldst�cke.
	
	// ------ B_Say_Smalltalk (TA_Smalltalk) ------
	VAR	string Smalltalk01;				// ...wenn Du meinst...
	VAR	string Smalltalk02;				// ...kann schon sein...
	VAR	string Smalltalk03;				// ...war nicht besonders schlau....
	VAR	string Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	string Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	string Smalltalk06;				// ...war doch klar, da� das �rger gibt...
	VAR	string Smalltalk07;				// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
	VAR	string Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	string Smalltalk09;				// ...an der Gechichte mu� wohl doch was dran sein...
	VAR	string Smalltalk10;				// ...man mu� eben aufpassen was man rumerz�hlt...
	VAR	string Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	string Smalltalk12;				// ...man darf auch nicht alles glauben, was man h�rt...
	VAR	string Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	string Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	string Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	string Smalltalk16;				// ...fr�her w�re das ganz anders gelaufen...
	VAR	string Smalltalk17;				// ...gequatscht wird viel...
	VAR	string Smalltalk18;				// ...ich h�r nicht mehr auf das Gefasel...
	VAR	string Smalltalk19;				// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	string Smalltalk20;				// ...ich glaube kaum, da� sich daran was �ndern wird...
	VAR	string Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	string Smalltalk22;				// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
	VAR	string Smalltalk23;				// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
	VAR	string Smalltalk24;				// ...la� uns lieber �ber was anderes reden...
	//Tough Guy (SLD/MIL/DJG)
	VAR	string Smalltalk25;				// ...der war doch sturzbetrunken...							
	VAR	string Smalltalk26;				// ...mit mir kann man sowas nicht machen...			
	VAR	string Smalltalk27;				// ...alle sind gerannt wie die Hasen, ich war ganz allein...
	//ProInnos (NOV/KDF/PAL)
	VAR	string Smalltalk28;				// ...so steht es in den heiligen Schriften...							
	VAR	string Smalltalk29;				// ...ich handle stets in Innos Namen...			
	VAR	string Smalltalk30;				// ...niemand darf gegen die g�ttliche Ordnung versto�en...
		
	// ------ Lehrer-Kommentare ------
	var string NoLearnNoPoints			;	//NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string NoLearnOverPersonalMAX	;	//NSC-Lehrer verbietet Steigerung �BER sein pers�nliches Lehrer-Maximum
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
	var	string Dead				;			// T�dlich verletzt
	VAR	string Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_3			;			// Treffer kassiert im Kampf	
	
	var string ADDON_WRONGARMOR;			//Sc hat unangemessene R�stung an				//Default
	var string ADDON_WRONGARMOR_SLD;		//Beide SLD/DJG und falsche R�stung
	var string ADDON_WRONGARMOR_MIL;		//Beide MIL/PAL	und falsche R�stung
	var string ADDON_WRONGARMOR_KDF;		//Beide KDF und falsche R�stung
	var string ADDON_NOARMOR_BDT;			//self ist BAndite und SC hat keine R�stung an.
	
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
// SVMs m�ssen immer "SVM_x" heissen, 
// wobei x die VoiceNummer ist.	
// **********************************

// ------ wird nur intern gebraucht! ------
instance SVM_0 (C_SVM)				
{

};

instance SVM_1 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_1_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//A jednak mi si� nie wymkniesz!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Doigra�e� si�!
	DieMonster					=	"SVM_1_DieMonster"					;//Znowu jedna z tych g�upich bestii!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Czekaj tylko, ty parszywy z�odzieju!
	HandsOff					=	"SVM_1_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Ta przekl�ta bestia po�era nasze owce!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//�adne bestie nie maj� tu prawa wst�pu!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Czekaj tylko, bydlaku!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//W takim razie b�d� musia� ci� st�d wykopa�!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//A czego TY tam szuka�e�, h�?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Gi�, gnido!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//To ju� koniec, �mieciu!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okrada�!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//W przysz�o�ci trzymaj �apska z dala od cudzych spraw.
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Nigdy wi�cej tego nie r�b! To NASZE owce!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//Co za g�upia bestia!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Nigdy wi�cej nie pr�buj si� ze mn� mierzy�!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Trzeba by�o mnie s�ucha�!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//A teraz zmywaj si� st�d!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Tu si� nie walczy, jasne?! Niech to b�dzie dla ciebie nauczk�!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_1_RunAway"						;//A niech to! Trzeba wia�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALARM!
	Guards						=	"SVM_1_Guards"						;//STRA�!
	Help						=	"SVM_1_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_1_GoodKill"					;//Dobrze! Wyko�cz �wini�!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//St�j, �mieciu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Wynocha!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Czego tu szukasz? Odejd�!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//No, wyno� si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Cholera, co si� dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Z�oto! Zaopiekuj� si� nim...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Ten frajer nie ma nawet z�ota.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Zajm� si� twoj� broni�...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Ej! Uwa�aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Ci�gle ci ma�o?!
	StopMagic					=	"SVM_1_StopMagic"					;//Zabieraj si� z t� swoj� magi�!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Powiedzia�em: KONIEC z magi�! Og�uch�e�, czy co?!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Og�uch�e�? Od�� t� bro�!
	WiseMove					=	"SVM_1_WiseMove"					;//No prosz�, jednak mo�na!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//Jeszcze zobaczymy...
	OhMyHead					=	"SVM_1_OhMyHead"					;//Och, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//Wreszcie co� si� dzieje...
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//Oni zrobi� sobie krzywd�...
	GoodVictory					=	"SVM_1_GoodVictory"					;//Zas�u�y� sobie na to!
	NotBad						= 	"SVM_1_NotBad"						;//Nie�le... Ca�kiem nie�le.
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//Co za brutal...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Dobrze, tak trzymaj!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//No, dalej!
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Mocniej!
	Ooh01						=	"SVM_1_Ooh01"						;//Nie pozw�l na to!
	Ooh02						=	"SVM_1_Ooh02"						;//Dasz sobie rad�!
	Ooh03						=	"SVM_1_Ooh03"						;//A niech to!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Wynocha z mojego ��ka!
	Awake						= "SVM_1_Awake"							;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Powiadaj�, �e by�e� u kapitana i za�atwi�e� spraw�.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Pono� by�e� u Ojca Parlana i wyspowiada�e� si� ze swych grzech�w?
	ABS_FARM					= "SVM_1_ABS_FARM"						;//S�ysza�em, �e by�e� u Lee i doprowadzi�e� spraw� do porz�dku.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Tak po prostu zaszlachtowa� nasze owce... Wyno� si�!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Z takimi jak ty nie b�d� rozmawia�!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Zejd� mi z oczu, parszywy z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Jeste� zaka�� swojego zakonu! Lord Hagen b�dzie w�ciek�y!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Jeste� zaka�� stra�y miejskiej! Lord Andre na pewno da ci nauczk�!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre dowie si� o wszystkim!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Twoje czyny z pewno�ci� nie uciesz� Ojca Parlana!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Dostanie ci si� za to od Lee! I na co ci to by�o?!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Kapitan Garond rozliczy ci� z tego!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//No ju� dobrze, wygra�e�. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokaza�, kto tu rz�dzi?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Chcesz si� jeszcze raz ze mn� spr�bowa�?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 sztuk z�ota.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 sztuk z�ota.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 sztuk z�ota.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 sztuk z�ota.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 sztuk z�ota.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 sztuk z�ota.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 sztuk z�ota.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 sztuk z�ota.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 sztuk z�ota.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 sztuk z�ota.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 sztuk z�ota.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 sztuk z�ota.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 sztuk z�ota.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 sztuk z�ota.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 sztuk z�ota.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 sztuk z�ota.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 sztuk z�ota.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 sztuk z�ota.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 sztuk z�ota.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 sztuk z�ota.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 sztuk z�ota.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 sztuk z�ota.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 sztuk z�ota.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 sztuk z�ota.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 sztuk z�ota.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 sztuk z�ota.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 sztuk z�ota.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...naprawd� s�dzisz...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...wszystko jest mo�liwe...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...powinien by� wiedzie� lepiej...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...tak jakby brakowa�o mi zmartwie�...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...kto opowiada takie rzeczy...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...przez to b�dzie jeszcze wi�cej k�opot�w...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...wiesz, m�wi si� o tym i o tamtym...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...ja bym tego nie zrobi�...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...to wszystko tylko pog�oski...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...trzeba uwa�a� na to, co si� m�wi...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...mog�em ci powiedzie� wcze�niej...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...w�a�ciwie mo�e by� go tylko �al...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...to przecie� nic nowego...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...to przecie� oczywiste...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...mnie nie musisz o to pyta�...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...to nie mo�e by� tak dalej...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...znasz ju� moje zdanie...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...powiedzia�em dok�adnie to samo...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...nic si� nie zmieni...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...dlaczego dowiaduj� si� o tym dopiero teraz...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...po prostu trzeba odczeka�....
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...niekt�re problemy same si� rozwi�zuj�...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...nie chc� ju� o tym s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...by� w sztok pijany...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...nie ze mn� te numery...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...pouciekali jak zaj�ce, by�em zupe�nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...tak jest napisane w �wi�tych pismach...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...w swych dzia�aniach kieruj� si� wol� Innosa...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//...nie wolno wyst�powa� przeciwko boskiemu porz�dkowi...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_1_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_1_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_1_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_1_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_1_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//A gdzie si� wybierasz?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Id� od strony ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Id� od strony ku�ni w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz si� do nich po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Po prostu przejd� obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Po prostu przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Po prostu zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//To nie jest twoje ubranie. Nie b�d� z tob� rozmawia�.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Jak ty wygl�dasz? Ubierz si� porz�dnie!
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Jeste� �o�nierzem! Ubierz si� odpowiednio!
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz si�!
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj si� st�d!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Gi�, bandycki pomiocie!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Piracka �winia!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_3_Weather"					;//Ale n�dzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Teraz ci� dorw�!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Zaraz ci� za�atwi�!
	DieMonster					=	"SVM_3_DieMonster"					;//Znowu jedna z tych g�upich bestii!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Czekaj tylko, ty parszywy z�odzieju!
	HandsOff					=	"SVM_3_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Ta przekl�ta bestia z�era nasze owce!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//�adne stwory nie maj� tu prawa wst�pu!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Czekaj tylko, ty gnido!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Nie chcesz i��? Dobrze!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Czego tam szuka�e�?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Gi�, gnido!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Zas�u�y�e� sobie na to, bydlaku!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//Na przysz�o�� trzymaj si� z dala od cudzej w�asno�ci!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Nigdy wi�cej tego nie r�b! To s� nasze owce!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//Ale g�upia bestia!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Nigdy wi�cej nie pr�buj si� ze mn� mierzy�!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//A teraz zmywaj si� st�d!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Tu si� nie walczy, jasne?! Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Nie r�b mi krzywdy!
	RunAway						= 	"SVM_3_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALARM!
	Guards						=	"SVM_3_Guards"					;//STRA�!
	Help						=	"SVM_3_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_3_GoodKill"				;//No, wyko�cz �wini�!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//No, biegnij! Najszybciej jak potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Czego tu szukasz? Odejd�!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//No, wyno� si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//Cholera, co si� dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Ty frajerze, nawet nie masz z�ota!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Lepiej zaopiekuj� si� twoj� broni�...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//Lepiej uwa�aj! Nast�pnym razem ci przy�o��.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Ci�gle ci ma�o?!
	StopMagic					=	"SVM_3_StopMagic"				;//Sko�cz wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Chcesz dosta�? Natychmiast przesta�!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Od�� wreszcie t� cholern� bro�!
	WiseMove					=	"SVM_3_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_3_OhMyHead"				;//Och, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//Aach, walka..
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_3_GoodVictory"			;//Ale mu pokaza�e�!
	NotBad						= 	"SVM_3_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//Na bog�w! Jak brutalnie...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Poka� mu!
	Ooh01						=	"SVM_3_Ooh01"					;//Trzymaj si�!
	Ooh02						=	"SVM_3_Ooh02"					;//Uwaga!
	Ooh03						=	"SVM_3_Ooh03"					;//O! To musia�o bole�!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Wynocha z mojego ��ka!
	Awake						= "SVM_3_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//By�e� zatem u kapitana i doprowadzi�e� wszystko do porz�dku.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//By�e� zatem u Ojca Parlana i wyspowiada�e� si� ze swoich grzech�w.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//By�e� wi�c u Lee i wyja�ni�e� spraw�.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Tak po prostu zaszlachtowa� nasze owce!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Zostaw mnie w spokoju, bydlaku!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Zostaw mnie w spokoju, ty parszywy z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Jeste� ha�b� dla swojego zakonu! Poczekaj tylko, a� Lord Hagen si� o tym dowie!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Ha�bisz dobre imi� stra�y miejskiej! Poczekaj, a� dowie si� o tym Lord Andre!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Poczekaj tylko, a� Lord Andre si� o tym dowie.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Poczekaj tylko, a� dowie si� o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Poczekaj tylko, a� Lee si� o tym dowie...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Poczekaj, a� dowie si� o tym kapitan Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Dobrze, dobrze. Jeste� lepszy ode mnie. Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//Wiesz ju� chyba, kt�ry z nas jest tym silniejszym... Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//My�la�em, �e chcesz si� ze mn� zmierzy�. Zmieni�e� zdanie? Wolisz jednak ROZMAWIA�, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 sztuk z�ota.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...naprawd� my�lisz...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...wszystko jest mo�liwe...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...powinien by� m�drzejszy...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...tak jakbym nie mia� wystarczaj�co du�o problem�w...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...kto ci to powiedzia�...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...z tego wyniknie tylko jeszcze wi�cej k�opot�w...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...kr��� ostatnio r�ne plotki...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...nigdy by mi nie przysz�o do g�owy...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...to przecie� tylko pog�oski...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...trzeba uwa�a� na to, co si� m�wi...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...mog�em ci powiedzie� wcze�niej...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...biedakowi mo�na tylko wsp�czu�...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...to przecie� nic nowego...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...to przecie� oczywiste...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...mnie nie musisz o to pyta�...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...tak dalej by� nie mo�e...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...znasz ju� moje zdanie...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...dok�adnie to samo powiedzia�em...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...nic tego nie zmieni...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...czemu dowiaduj� si� o tym dopiero teraz...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...poczekajmy, co z tego wyniknie...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...niekt�re problemy same si� rozwi�zuj�...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...ju� nie chce mi si� o tym s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...przecie� on by� w sztok pijany...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...nie pozwol� si� tak traktowa�...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...wszyscy uciekali jak zaj�ce, by�em zupe�nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...tak jest napisane w �wi�tych pismach...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...dzia�am zawsze w imieniu Innosa...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...nikt nie mo�e wyst�powa� przeciwko boskiemu porz�dkowi...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_3_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_3_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_3_GALGEN"					;//Znajdujesz si� teraz na placu wisielc�w.
	KASERNE						= "SVM_3_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_3_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Dok�d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Id�c od kowala, mi� przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Id� od kowala ulic� portow�, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Kiedy znajdziesz si� przed �wi�tyni�, skr�� w lewo i id� potem wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Je�eli b�dziesz szed� od strony targowiska wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Udaj si� drog� obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Id� w d� uliczk� odchodz�c� od placu wisielc�w, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wej�� po schodach.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Zejd� po schodach znajduj�cych si� na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Zejd� po schodach znajduj�cych si� na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaarrrhhh!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju!
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Je�li chcesz porozmawia�, najpierw si� jako� ubierz.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//My, �o�nierze, nosimy nasze mundury z dum�. Za�� sw�j.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//W naszym Zakonie wszyscy s� r�wni, dlatego nosimy identyczne ubrania. Przebierz si�!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Wyszed�e� prosto z wi�zienia, prawda? Za�� na siebie jakie� ubranie!

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//CHOD� TU, BANDYTO!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//CHOD� TU, PIRACIE!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_4_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//To znowu TY!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Za�atwi� ci�!
	DieMonster					=	"SVM_4_DieMonster"					;//Znowu jedna z tych g�upich bestii!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ty ma�y, parszywy z�odzieju!
	HandsOff					=	"SVM_4_HandsOff"					;//Zabieraj �apy!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Ta bestia z�era nasze owce!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//A TEN stw�r czego tu chce?!
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//No, teraz to mnie wkurzy�e�!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Kto nie chce s�ucha�, musi poczu�...
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Czego tam szuka�e�, co?!
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Gi�!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Cholerny bydlak...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//No, koniec z tob�, bestio!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Trzymaj na przysz�o�� �apy z dala od moich rzeczy, jasne?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Trzymaj na przysz�o�� �apy przy sobie!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Nie podno� nigdy wi�cej r�ki na nasze owce!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//G�upie stworzenie!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Nie pr�buj tego jeszcze raz, ch�opczyku!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Niech to b�dzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Wstawaj i wyno� si� st�d!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Nie chc� ci� wi�cej tam widzie�, zrozumiano?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Je�eli kto� tu rozdziela ciosy, to jestem to ja, zrozumiano?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_4_RunAway"						;//Cholera! Trzeba ucieka�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALARM!
	Guards						=	"SVM_4_Guards"					;//STRA�!
	Help						=	"SVM_4_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//No! Tak nale�y obchodzi� si� z bestiami!
	GoodKill					= 	"SVM_4_GoodKill"				;//Zas�uguje na to!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//Jeszcze si� spotkamy!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Wyno� si�!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Zabieraj si� st�d!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//Co si� dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Ty frajerze, nawet z�ota nie masz!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Wezm� sobie twoj� bro�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//Lepiej uwa�aj! Nast�pnym razem ci przy�o��.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//Znowu chcesz w mord�?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Sko�cz wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Chcesz dosta�? Natychmiast przesta�!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Od�� wreszcie t� cholern� bro�!
	WiseMove					=	"SVM_4_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_4_OhMyHead"				;//O rany, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_4_GoodVictory"				;//Ale mu pokaza�e�!
	NotBad						= 	"SVM_4_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Wal z ca�ej si�y!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Poka� mu!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Wyko�cz go!
	Ooh01						=	"SVM_4_Ooh01"					;//Bro� si�!
	Ooh02						=	"SVM_4_Ooh02"					;//Oddaj cios!
	Ooh03						=	"SVM_4_Ooh03"					;//Uuu, to musia�o bole�!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//Cholera, co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Wynocha z mojego ��ka!
	Awake						= "SVM_4_Awake"						;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Za�atwi�e� zatem spraw� z kapitanem.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Opowiedzia�e� zatem Ojcu Parlanowi o swych czynach.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//M�wi�, �e Lee za�atwi� ca�� spraw�.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to ju� przesada! Wyno� si�!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Jeste� jakim� oprychem - lepiej st�d odejd�!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Przekl�ty z�odziej! Gardz� takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Wydawa�o mi si�, �e od paladyna mo�na spodziewa� si� czego� wi�cej. Lord Hagen b�dzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//�e takich jak ty w og�le przyjmuj� do stra�y miejskiej! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre dowie si� o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Ojciec Parlan b�dzie w�ciek�y!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Odpowiesz za to przed Lee!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Kapitan Garond nie b�dzie zadowolony, kiedy o tym us�yszy! Zap�acisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Masz ca�kiem niez�e uderzenie... Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//Jeszcze jakie� pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 sztuk z�ota.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...to rzeczywi�cie prawda...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...s�ysza�em co� innego...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...nie m�w, �e o tym nie wiedzia�e�...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...cz�owiek nie wie, komu wierzy�...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...to tylko gadanie...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...no widzisz, ju� mi lepiej...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...mnie to ju� nic nie dziwi...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...to naprawd� nie m�j problem...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...naprawd� w to wierzysz...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...ode mnie nie us�ysz� nawet s��wka...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...to by�o oczywiste od dawna...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...pos�ucha� niew�a�ciwych ludzi...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...je�eli on sam tego nie widzi, to nie mog� mu pom�c...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...nie m�wi� przecie� niczego nowego...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...sam by na to nie wpad�...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...przecie� wiadomo o tym od dawna...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...nieprzyjemna sprawa...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...zrobi�bym to inaczej...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...ca�kowicie si� z tob� zgadzam...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...czy to si� kiedykolwiek zmieni...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...nikt mi o tym nie m�wi�...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...i tak nic nie zmienisz...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...wcale mnie to nie dziwi...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...ale on zawsze wie lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...i tak liczy si� tylko si�a, wi�c nie m�w mi takich rzeczy...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...on nawet nie wie, jak si� trzyma miecz...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...tak, naprawd� tak powiedzia�...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...kto� za to odpowie...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos o�wieca wszystkich tych, kt�rzy widz� jego m�dro��...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...w ko�cu musi wygra� sprawiedliwo��...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_4_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_4_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_4_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_4_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_4_HAFEN"						;//Jeste� w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Gdzie chcesz si� dosta�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Id� od strony kowala przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Id� od strony kowala w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Po prostu przejd� obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Po prostu przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz si� tam po schodach.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Po prostu zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nadbrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Ubierz si� porz�dnie, to porozmawiamy.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Za�� sw�j cholerny pancerz, je�li chcesz ze mn� rozmawia�!
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Nie dosta�e� jednego z naszych pancerzy? No to sobie taki za�atw.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Sk�d ty si� wzi��e�? Przebierz si�, wtedy pogadamy.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Biedak�w nam nie trzeba. Wr��, jak b�dzie ci� sta� na pancerz.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Jeszcze jeden bandyta!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Ty zawszony piracie!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_5_Weather"						;//Ale beznadziejna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//A jednak ci� mam!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Teraz ci� za�atwi�!
	DieMonster					=	"SVM_5_DieMonster"					;//Znowu jedna z tych przekl�tych bestii!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Czekaj tylko, parszywy z�odzieju!
	HandsOff					=	"SVM_5_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Ta przekl�ta bestia z�era nasze owce!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//�adne stwory nie maj� tu prawa wst�pu!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//No, teraz ci si� dostanie, bydlaku!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//B�d� ci� wi�c musia� wyrzuci� si��!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Czego TY tam szuka�e�?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Gi�, gnido!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Ju� po tobie, �mieciu.
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Jedna cholerna bestia mniej!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Nie pr�buj nigdy wi�cej mnie okrada�!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//Na przysz�o�� trzymaj �apy z dala od nieswoich rzeczy!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Nigdy wi�cej tego nie r�b! To s� nasze owce!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Nigdy wi�cej nie pr�buj si� ze mn� mierzy�!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//A teraz zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Tutaj si� nie walczy, jasne?! Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_5_RunAway"						;//Cholera! Trzeba ucieka�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALARM!
	Guards						=	"SVM_5_Guards"						;//STRA�!
	Help						=	"SVM_5_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_5_GoodKill"					;//Dobrze, za�atw drania!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//St�j, �mieciu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Wyno� si�!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Czego tu szukasz?! Odejd�!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//No, zabieraj si� st�d!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Cholera, co si� dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Z�oto! Teraz nale�y do mnie...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Nie masz nawet z�ota?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Wezm� twoj� bro� na przechowanie...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, uwa�aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Jeszcze ci ma�o?!
	StopMagic					=	"SVM_5_StopMagic"					;//Trzymaj si� z dala ode mnie z t� twoj� magi�!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Sko�cz z t� magi�! Masz problem ze s�uchem?!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//G�uchy jeste�? Od�� wreszcie t� bro�!
	WiseMove					=	"SVM_5_WiseMove"					;//Widzisz, to nie by�o takie trudne!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//Jeszcze raz, a si� doigrasz...
	OhMyHead					=	"SVM_5_OhMyHead"					;//Och, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//Wreszcie co� si� dzieje...
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//Porozwalaj� sobie �by...
	GoodVictory					=	"SVM_5_GoodVictory"					;//Zas�u�y� sobie na to!
	NotBad						= 	"SVM_5_NotBad"						;//Nie�le...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//Ale brutal...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Tak, dobrze tak!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//No, dalej!
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Mocniej, mocniej!
	Ooh01						=	"SVM_5_Ooh01"						;//Nie pozwalaj na to!
	Ooh02						=	"SVM_5_Ooh02"						;//Poka�, kto tu rz�dzi!
	Ooh03						=	"SVM_5_Ooh03"						;//To przecie� niemo�liwe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//Co to by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Wynocha z mojego ��ka!
	Awake						= "SVM_5_Awake"							;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//M�wi�, �e by�e� u kapitana i za�atwi�e� ca�� spraw�.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Pono� by�e� u Ojca Parlana i wyspowiada�e� si� ze swych grzech�w?
	ABS_FARM					= "SVM_5_ABS_FARM"						;//By�e� zatem u Lee i wyja�ni�e� spraw�.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Tak po prostu szlachtowa� nasze owce! Zabieraj si� st�d!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Nie rozmawiam z takimi opryszkami jak ty!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Zejd� mi z oczu, parszywy z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Ha�bisz dobre imi� swojego zakonu! Lord Hagen b�dzie w�ciek�y!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Jeste� ha�b� dla stra�y miejskiej! Lord Andre teraz ci poka�e!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre dowie si� o twoim czynie!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Ojciec Parlan b�dzie niepocieszony!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee si� z tob� rozprawi! Zobaczysz, czy by�o warto!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Kapitan Garond ci� z tego rozliczy!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//No ju� dobrze, wygra�e�. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokaza�, kto tu rz�dzi?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Chcesz si� jeszcze raz ze mn� spr�bowa�?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 sztuk z�ota.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 sztuk z�ota.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 sztuk z�ota.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 sztuk z�ota.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 sztuk z�ota.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 sztuk z�ota.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 sztuk z�ota.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 sztuk z�ota.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 sztuk z�ota.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 sztuk z�ota.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 sztuk z�ota.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 sztuk z�ota.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 sztuk z�ota.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 sztuk z�ota.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 sztuk z�ota.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 sztuk z�ota.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 sztuk z�ota.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 sztuk z�ota.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 sztuk z�ota.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 sztuk z�ota.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 sztuk z�ota.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 sztuk z�ota.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 sztuk z�ota.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 sztuk z�ota.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 sztuk z�ota.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 sztuk z�ota.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 sztuk z�ota.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...naprawd� s�dzisz...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...wszystko jest mo�liwe...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...powinien by� m�drzejszy...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...jakby by�o ma�o problem�w...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...kto ci to powiedzia�...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...z tego b�dzie jeszcze wi�cej k�opot�w...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...ludzie gadaj� o tym i o tamtym...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...lepiej tego nie robi�...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...to wszystko tylko plotki...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...trzeba uwa�a�, co si� komu m�wi...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...trzeba by�o mnie spyta� wcze�niej...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...�al mi tego biedaka...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...to przecie� nic nowego...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...to przecie� oczywiste...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...mnie nie musisz o to pyta�...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...tak dalej by� nie mo�e...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...moje zdanie ju� znasz...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...moja reakcja by�a taka sama...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...nic si� w tej sprawie nie zmieni...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...czemu dowiaduj� si� o tym dopiero teraz...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...poczekajmy, co z tego wyniknie...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...niekt�re problemy same si� rozwi�zuj�...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...ju� nie mog� tego s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...by� w sztok pijany...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...nie pozwol�, �eby mnie tak traktowano...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...wszyscy uciekali jak zaj�ce, by�em zupe�nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...tak jest napisane w �wi�tych pismach...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...dzia�am w imieniu Innosa...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...nie wolno narusza� boskiego porz�dku...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_5_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_5_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_5_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_5_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_5_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Dok�d si� wybierasz?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przej�ciem, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Kiedy znajdziesz si� przed �wi�tyni�, p�jd� w lewo i potem wzd�u� mur�w, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Id�c od strony �wi�tyni, mijasz knajp� po lewej i dochodzisz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Je�eli id�c od strony targowiska, b�dziesz szed� wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Id� wzd�u� koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Id� wzd�u� koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wej�� po schodach.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, to dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaarhhhh!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Ubierz si� porz�dnie.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Nie jeste� ju� jednym z nas? Nie chc� mie� z tob� nic do czynienia.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//My - �o�nierze - walczymy za kr�la, dlatego nosimy jego pancerze!
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Po co Zakon da� ci ubranie, je�li nie do noszenia? Pomy�l troch�.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Kim ty w og�le jeste�? Nie masz nawet pancerza. Odejd�!

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//A, bandyta!
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Zaraz ci� za�atwi�, piracie!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_6_Weather"					;//Pieska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Teraz ci� dorw�!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Nie powiniene� tu przychodzi�!
	DieMonster					=	"SVM_6_DieMonster"					;//No chod�!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Z�odziej! Czekaj no...
	HandsOff					=	"SVM_6_HandsOff"					;//Zabieraj �apy!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Odejd� od naszych owiec, bestio!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//�adna bestia tu nie wejdzie!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Po�a�ujesz tego!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Ostrzega�em ci�...
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hej, WYNO� SI�!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hej! Czego tam szuka�e�?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Przesta�! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Teraz ci� wypatrosz�!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Tyle na ten temat...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Hej! Ci�gle to potrafi�!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Ostrzegam ci�! Nie pr�buj tego ponownie, ty przekl�ty z�odzieju!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//Trzymaj �apy z dala od cudzej w�asno�ci!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//I trzymaj si� na przysz�o�� z dala od naszych owiec!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Nie wa� si� nigdy wi�cej mnie atakowa�!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Ostrzega�em ci�...
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//A teraz zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Nie chc� ci� ju� tam wi�cej widzie�, jasne?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Tu si� nie walczy, niech to b�dzie dla ciebie nauczka.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Nie r�b g�upstw!
	RunAway						= 	"SVM_6_RunAway"						;//Zmywam si� st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALARM!
	Guards						=	"SVM_6_Guards"					;//STRA�!
	Help						=	"SVM_6_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//Daj im wycisk!
	GoodKill					= 	"SVM_6_GoodKill"				;//No, poka� draniowi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//Jeszcze ci� dorw�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Nie masz tu czego szuka�!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//No, wyno� si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Co to ma by�? Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//Cholera, czego chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//No, przynajmniej masz jakie� z�oto...
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Eeee... Nawet z�ota nie ma...
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Zajm� si� twoj� broni�...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//Nie pr�buj tego ponownie, ch�opcze!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//Znowu szukasz guza?
	StopMagic					=	"SVM_6_StopMagic"				;//Przesta� z t� magi�!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Ostatnie ostrze�enie! Sko�cz z tym czarowaniem!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Od�� to albo ci przy�o��!
	WiseMove					=	"SVM_6_WiseMove"				;//Nie jeste� wcale taki g�upi, na jakiego wygl�dasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//Nie pr�buj tego ponownie...
	OhMyHead					=	"SVM_6_OhMyHead"				;//Och, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//Teraz b�dzie zabawnie...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//O bogowie...
	GoodVictory					=	"SVM_6_GoodVictory"			;//To b�dzie dla niego nauczka...
	NotBad						= 	"SVM_6_NotBad"					;//HA! To by�o niez�e!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//Brutalny dra�!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Nie przestawaj!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Za�atw go!
	Ooh01						=	"SVM_6_Ooh01"					;//Uwa�aj!
	Ooh02						=	"SVM_6_Ooh02"					;//Paruj!
	Ooh03						=	"SVM_6_Ooh03"					;//Cholera, to bola�o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//Co ty tutaj robisz?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Wynocha z mojego ��ka!
	Awake						= "SVM_6_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Kapitan wyja�ni� wi�c z tob� ca�� spraw�.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Ojciec Parlan uwolni� ci� od twoich grzech�w.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//By�e� zatem u Lee i wyja�ni�e� spraw�.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Atakujesz owce? Bardziej bezbronnej ofiary nie mog�e� sobie pewnie znale��?!
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Z takimi jak ty nie chc� mie� nic wsp�lnego!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Ze z�odziejami nie chc� mie� nic wsp�lnego!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//I ty chcesz by� paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Naprawd� nale�ysz do stra�y miejskiej? Lordowi Andre si� to nie spodoba!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Id� do Lorda Andre, p�ki jeszcze mo�esz.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Id� do Ojca Parlana. Otrzymasz od niego pokut�!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee si� o tym dowie... Zap�acisz za to!
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Kapitanowi Garondowi wcale to si� nie spodoba. Porozmawiaj z nim, p�ki jeszcze mo�esz!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygra�e�. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//S�dz�, �e wiesz ju�, kogo masz przed sob�. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Znowu ty? Chcesz si� znowu ze mn� zmierzy� czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 sztuk z�ota.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...trudno mi w to uwierzy�...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...trudno by� tego pewnym...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...przecie� wiedzia� o tym wcze�niej...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...nie wiem ju�, w co wierzy�...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...nie wiem, czym on si� tak denerwuje...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...nie trzeba mi wi�cej k�opot�w...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...m�wi� to i owo...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...b�d� si� lepiej trzyma� od tego z daleka...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...nie mo�na wierzy� we wszystko, co si� s�yszy...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...ode mnie tego nie dosta�...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...przysz�o mi to do g�owy...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...moje zdanie i tak nikogo nie obchodzi...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...nie zas�u�y� sobie na to...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...nie m�w, �e o tym nie wiesz...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...to by�o oczywiste...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...sk�d ty to znowu masz...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...nie mo�e tak dalej by�...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...mam swoje zdanie na ten temat...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...by�o dok�adnie tak, jak m�wisz...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...nie s�dz�, �eby co� si� zmieni�o...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...s�ysz� o tym po raz pierwszy...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...mo�emy jedynie przeczeka�...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...musia�y pojawi� si� problemy...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...czemu nikt mnie nie s�ucha...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...ucieka�, jakby goni� go sam Beliar...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...w ko�cu i tak go oczywi�cie dorwali�my...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...trzeba silnie uderzy� w sam �rodek...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...niekt�rzy nie zdaj� sobie w og�le sprawy ze swoich grzech�w...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...taka jest bowiem wola Innosa...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...jego czyny by�y sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_6_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_6_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_6_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_6_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_6_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Dok�d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przej�ciem, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Kiedy znajdziesz si� przed �wi�tyni�, p�jd� w lewo i potem wzd�u� mur�w, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Je�eli id�c od strony targowiska, b�dziesz szed� wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Id� po prostu wzd�u� koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Id� wzd�u� koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wej�� po schodach.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nadbrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//W tych �achmanach wygl�dasz jak idiota. Ubierz si�!
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//My�lisz, �e ci� nie poznaj�? Zje�d�aj i ubierz si� odpowiednio!
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//�o�nierzu! Co to za str�j?! Natychmiast si� przebierz!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//S�uga Innosa nie ukrywa si�! Id� po swoj� tog�.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//�azisz jak jaki� kopacz. Ubierz si�!

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Napad�e� niew�a�ciwego cz�owieka, BANDYTO!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Wyno� si� na morze, PIRACIE!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_7_Weather"						;//Kiepska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Znowu TY?!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Rozerw� ci� na kawa�ki!
	DieMonster					=	"SVM_7_DieMonster"					;//Znowu jedno z tych przekl�tych stworze�!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty ma�y, n�dzny z�odzieju!
	HandsOff					=	"SVM_7_HandsOff"					;//Trzymaj �apy z daleka!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Ten potw�r z�era nasze owce!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//A TA bestia co tu robi?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Teraz mnie wkurzy�e�!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Kto nie chce s�ucha�, musi poczu�...
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Co tam robi�e�, co?!
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Przestaniecie z tym?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Gi�!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//G�upi dure�...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Tyle na ten temat...
	ThiefDown					=	"SVM_7_ThiefDown"					;//Trzymaj na przysz�o�� �apy z dala od moich rzeczy, zrozumiano?!
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Trzymaj �apy przy sobie!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Trzymaj �apska z dala od naszych owiec!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Nie pr�buj tego ponownie, brachu!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Niech to b�dzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Wstawaj i zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Nie chc� ci� ju� tam wi�cej widzie�, jasne?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//To ja tutaj rozdaj� ciosy, zrozumiano?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Po prostu zostaw mnie w spokoju!
	RunAway						= 	"SVM_7_RunAway"						;//Cholera! Wynosz� si� st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALARM!
	Guards						=	"SVM_7_Guards"					;//STRA�!
	Help						=	"SVM_7_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//Tak trzeba z nimi post�powa�!
	GoodKill					= 	"SVM_7_GoodKill"				;//Dobrze, poka� �wini!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//Jeszcze ci� dorw�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Wyno� si�!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//No, wynocha!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Co ty tam robisz?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//Co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Ty frajerze, nawet z�ota nie masz!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Lepiej zaopiekuj� si� twoj� broni�...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//Uwa�aj! Nast�pnym razem ci przy�o��.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//Chcesz jeszcze raz dosta� w mord�?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Przesta� natychmiast z tym czarowaniem!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Chcesz dosta�? Przesta� w tej chwili!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Od�o�ysz wreszcie t� przekl�t� bro�?!
	WiseMove					=	"SVM_7_WiseMove"				;//M�dra decyzja!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_7_OhMyHead"				;//Och, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_7_GoodVictory"				;//Pokaza�e� mu, kto tu rz�dzi!
	NotBad						= 	"SVM_7_NotBad"					;//Hmm. Nie�le...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//No, do�� mu!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Poka� mu!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Niech ma, czego chcia�!
	Ooh01						=	"SVM_7_Ooh01"					;//Bro� si�!
	Ooh02						=	"SVM_7_Ooh02"					;//Nie daj si�!
	Ooh03						=	"SVM_7_Ooh03"					;//Oj! To musia�o bole�!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//Cholera, co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Wynocha z mojego ��ka!
	Awake						= "SVM_7_Awake"						;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Powiadaj�, �e kapitan wyprostowa� ca�� spraw�.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Zatem wyspowiada�e� si� Ojcu Parlanowi ze swoich grzech�w.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//M�wi�, �e Lee za�atwi� dla ciebie ca�� spraw�.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to ju� szczyt szczyt�w! Wyno� si�!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Jeste� jakim� oprychem - lepiej st�d odejd�!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Przekl�ty z�odziej! Gardz� takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Wydawa�o mi si�, �e od paladyna mo�na spodziewa� si� czego� wi�cej. Lord Hagen b�dzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Jak ty si� w og�le dosta�e� do stra�y?! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre dowie si� o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Ojciec Parlan b�dzie w�ciek�y!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee na pewno ci nie daruje!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Kapitan Garond nie b�dzie zadowolony, kiedy o tym us�yszy! Zap�acisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Masz ca�kiem niez�y cios... Czego chcesz ode mnie?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//Jeszcze jakie� pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 sztuk z�ota.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...to rzeczywi�cie prawda...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...mnie m�wili co innego...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...nie m�w, �e o tym nie wiesz...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...nie wiadomo ju�, komu mo�na ufa�...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...to tylko plotki...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...my�lisz, �e ja mam lepiej...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...nic mnie ju� nie dziwi...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...to naprawd� nie m�j problem...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...naprawd� w to wierzysz...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...ode mnie nikt si� niczego nie dowie...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...to by�o oczywiste...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...pos�ucha� niew�a�ciwych ludzi...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...je�eli on tego nie widzi, to przecie� nie mog� mu pomaga� wbrew jego woli...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...nie m�wi� ci przecie� nic nowego...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...sam by na to nie wpad�...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...to by�o wiadomo od dawna...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...kiepska sprawa...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...inaczej bym si� do tego zabra�...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...zupe�nie si� z tob� zgadzam...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...czy co� si� w ko�cu zmieni...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...nie dosz�o do mnie nic na ten temat...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...nic nie mog� na to poradzi�...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...to mnie wcale nie dziwi...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...nie, ale on oczywi�cie wie wszystko lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...i tak liczy si� tylko si�a, wi�c nie m�w mi takich rzeczy...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...on nawet nie wie, jak si� trzyma miecz...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...tak, naprawd� tak powiedzia�...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...kto� b�dzie musia� za to zap�aci�...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos przy�wieca tym wszystkim, kt�rzy potrafi� zg��bi� jego m�dro��...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...na ko�cu i tak zwyci�y sprawiedliwo��...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_7_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_7_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_7_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_7_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_7_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Gdzie chcesz si� dosta�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Id� od strony kowala przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Id� od strony kowala w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Kiedy b�dziesz sta� przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, miniesz knajp� po lewej, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Je�eli p�jdziesz wzd�u� mur�w miejskich od strony targowiska, to dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Przejd� obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz si� do niego po schodach.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nabrze�u w g�r� ulic� portow�, a dojdziesz do dolnego miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Po co to przebranie? Nie b�d� rozmawia� z kim�, kto nosi co� takiego.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Za�� pancerz!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//To pogwa�cenie zasad dotycz�cych ubioru. Natychmiast si� przebierz!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Lepiej za�� tog�. Do tego czasu b�d� si� modli� za ciebie w milczeniu.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Czego chcesz? Nie jeste� jednym z nas. Nie nosisz nawet pancerza.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Gi�, nikczemny bandyto!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Gi�, �a�osny piracie!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_8_Weather"					;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//No, teraz to ci� dorw�!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Wyko�cz� ci�!
	DieMonster					=	"SVM_8_DieMonster"					;//Znowu jedno z tych przekl�tych stworze�!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Czekaj tylko, parszywy z�odzieju!
	HandsOff					=	"SVM_8_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Ten dra� szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Ta przekl�ta bestia z�era nasze owce!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//�adne bestie nie maj� tu czego szuka�!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Teraz jestem naprawd� wkurzony!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Nie chcesz i��? Dobrze!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Czego tam szuka�e�?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Mo�esz przesta�!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Gi�, bydlaku!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Zas�u�y�e� sobie na to, bydlaku!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//Trzymaj si� na przysz�o�� z dala od nieswoich rzeczy!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Nigdy wi�cej tego nie r�b! To s� nasze owce!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//Co za g�upie bestie!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Nigdy wi�cej nie pr�buj si� ze mn� mierzy�!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Szkoda, �e mnie nie pos�ucha�e�!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//A teraz znikaj st�d!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//Lepiej, �ebym ci� ju� tam nigdy nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Tutaj si� nie walczy, zrozumiano!? Niech to b�dzie dla ciebie nauczk�!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Nie r�b mi krzywdy!
	RunAway						= 	"SVM_8_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALARM!
	Guards						=	"SVM_8_Guards"					;//STRA�!
	Help						=	"SVM_8_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_8_GoodKill"				;//No, wyko�cz �wini�!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//Tak, uciekaj! Najszybciej jak potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Wyno� si�!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Czego tu szukasz!? Id� sobie!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//No, wyno� si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Ej ty... Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//Co si� tu u diab�a dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Biedaku, nawet z�ota nie masz...
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Zaopiekuj� si� twoj� broni�...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//Uwa�aj! Nast�pnym razem ci przy�o��.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Ci�gle ci za ma�o!?
	StopMagic					=	"SVM_8_StopMagic"				;//Przesta� z t� cholern� magi�!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Szukasz k�opot�w!? Przesta� natychmiast!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Od�� t� bro�!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Od�� wreszcie t� przekl�t� bro�!
	WiseMove					=	"SVM_8_WiseMove"				;//Sprytnie!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//Prosz�... Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_8_OhMyHead"				;//O rany, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//Na bog�w, walka!
	GoodVictory					=	"SVM_8_GoodVictory"			;//Da�e� mu niez�y wycisk...
	NotBad						= 	"SVM_8_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Uderz go!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Poka� mu!
	Ooh01						=	"SVM_8_Ooh01"					;//Trzymaj si�!
	Ooh02						=	"SVM_8_Ooh02"					;//Uwaga!
	Ooh03						=	"SVM_8_Ooh03"					;//A�! Ten by� celny...
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Wynocha z mojego ��ka!
	Awake						= "SVM_8_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//By�e� wi�c u kapitana i wyja�ni�e� spraw�.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//By�e� zatem u Ojca Parlana i opowiedzia�e� mu o swoich grzechach.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//By�e� zatem u Lee i doprowadzi�e� wszystko do porz�dku.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Tak po prostu szlachtowa� nasze owce!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Zostaw mnie w spokoju, draniu!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Zostaw mnie w spokoju, ty parszywy z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Jeste� zaka�� swojego zakonu! Poczekaj tylko, a� dowie si� o tym Lord Hagen!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Okrywasz ha�b� ca�� stra� miejsk�! Czekaj tylko, a� dowie si� o tym Lord Andre!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Poczekaj, a� dowie si� o tym Lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Poczekaj tylko, a� us�yszy o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Poczekaj, a� Lee si� o tym dowie...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Poczekaj tylko, a� dowie si� o tym kapitan Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Dobrze ju�, dobrze, jeste� lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//S�dz�, �e wiesz ju�, kt�ry z nas jest tym silniejszym... czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//My�la�em, �e chcesz si� ze mn� spr�bowa�. Zmieni�e� zdanie? Mo�e wolisz ROZMAWIA�? Jasne.
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 sztuk z�ota.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...to rzeczywi�cie prawda...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...mnie m�wili co innego...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...tylko nie m�w, �e o tym nie wiesz...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...nie wiadomo ju�, komu mo�na ufa�...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...a tam, to tylko gadanie...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...no popatrz, ju� mi lepiej...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...mnie to i tak nikt nie s�ucha...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...to naprawd� nie m�j problem...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...naprawd� w to wierzysz...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...ode mnie nikt si� tego nie dowie...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...o tym by�o wiadomo od dawna...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...pos�ucha� niew�a�ciwych ludzi...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...je�eli on tego nie widzi, to przecie� nie mog� mu pomaga� wbrew jego woli...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...nie m�wi� ci przecie� nic nowego...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...sam by na to nie wpad�...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...to przecie� wiadomo od dawna...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...to niedobrze...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...mo�na to by�o zrobi� zupe�nie inaczej...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...w zupe�no�ci si� z tob� zgadzam...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...czy co� si� w ko�cu zmieni...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...nic o tym nie wiem...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...i tak tego nie zmienisz...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...wcale mnie to nie dziwi...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...powinien wiedzie� lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...liczy si� przecie� tylko si�a, wi�c nie opowiadaj mi tu takich rzeczy...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...przecie� on nawet nie wie, jak si� trzyma miecz...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...tak, naprawd� tak powiedzia�...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...kto� b�dzie musia� za to zap�aci�...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos przy�wieca tym wszystkim, kt�rzy potrafi� zg��bi� jego m�dro��...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...w ko�cu zwyci�y sprawiedliwo��...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Widzisz, nauczy�e� si� czego� nowego...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_8_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_8_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_8_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_8_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_8_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//A ty dok�d?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Kiedy b�dziesz szed� od ku�ni, przejd� do�em przez przej�cie. Dojdziesz wtedy do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Id� od ku�ni w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Od strony placu �wi�tynnego biegnie przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Je�eli stoj�c plecami do �wi�tyni, p�jdziesz w lewo obok knajpy, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Id� od strony targowiska, wzd�u� mur�w miejskich, a dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach naprzeciwko hotelu.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Id� po prostu wzd�u� koszar, a powiniene� doj�� do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Id� uliczk� odchodz�c� od placu wisielc�w, to dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Id� po prostu wzd�u� koszar, a powiniene� doj�� do targowiska.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Zejd� po prostu po schodach znajduj�cych si� na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Zejd� po prostu po schodach znajduj�cych si� na prawo od g��wnego wej�cia. Dojdziesz nimi do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Id� od strony mur�w portowych ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaarrrhhhh!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Nie ufam ci. Nie pasujesz mi ani ty, ani tw�j ubi�r.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Wygl�da na to, �e wst�pi�e� gdzie� indziej. W takim razie nie chc� mie� z tob� nic wsp�lnego.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Musimy si� odpowiednio prezentowa�. Id�. Za�� pancerz.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos pragnie, by�my nosili jego togi z dum�. Id� i za�� swoj�.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Nie rozmawiam z kopaczami. Nie masz nawet pancerza!

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Ty pod�y bandyto!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIRACI!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_9_Weather"						;//Ale n�dzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Teraz ci� mam!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Lepiej by�o tu nie przychodzi�!
	DieMonster					=	"SVM_9_DieMonster"					;//Chod� tu, bydlaku!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Jeszcze jedna z tych bestii!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Tam! To jeszcze jedno z tych nikczemnych stworze�!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Parszywy z�odziej!
	HandsOff					=	"SVM_9_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Zostaw nasze owce, ty potworze!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Po�a�ujesz tego!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Ostrzegano ci�...
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Powiedzia�em WYNOCHA!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hej! Czego tam szuka�e�?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Przesta�! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Teraz si� zabawimy, gnido!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//I po sprawie...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Schei�e!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Ju� po tobie, bydlaku!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//I JESZCZE JEDEN parszywy stw�r za�atwiony!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Ostrzegam ci�! Nie pr�buj tego ponownie, ty przekl�ty z�odzieju!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//Trzymaj r�ce z dala od rzeczy, kt�re do ciebie nie nale��!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//I trzymaj si� na przysz�o�� z dala od naszych owiec!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//G�upie bydl�!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Nie wa� si� nigdy wi�cej mnie atakowa�!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Ostrzegano ci�...
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//A teraz wyno� si�!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Nie chc� ci� ju� tam nigdy wi�cej widzie�!
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Tutaj si� nie walczy, zapami�taj to sobie!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Nie zr�b czego� g�upiego!
	RunAway						= 	"SVM_9_RunAway"						;//Zmywam si�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALARM!
	Guards						=	"SVM_9_Guards"					;//STRA�!
	Help						=	"SVM_9_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//Poka� tym potworom...!
	GoodKill					= 	"SVM_9_GoodKill"				;//Taa... Poka� mu!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//Jeszcze ci� dorw�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Won!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Nie masz tu czego szuka�!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//No, wyno� si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Co to ma by�? Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//Czego u diab�a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Dobrze, �e przynajmniej masz jakie� z�oto!
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Ha! Nawet z�ota nie ma...
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Twoja bro� mo�e mi si� przyda�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//Lepiej nie pr�buj tego po raz drugi!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//Znowu szukasz guza?
	StopMagic					=	"SVM_9_StopMagic"				;//Tylko bez magii!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Ostrzegam po raz ostatni!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Od�� to albo ci przy�o��.
	WiseMove					=	"SVM_9_WiseMove"				;//Nie jeste� wcale taki g�upi, na jakiego wygl�dasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//Lepiej nie pr�buj tego po raz drugi!
	OhMyHead					=	"SVM_9_OhMyHead"				;//Aaach! M�j �eb...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//Teraz b�dzie zabawnie...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//O rany...
	GoodVictory					=	"SVM_9_GoodVictory"			;//B�dzie mia� nauczk�...
	NotBad						= 	"SVM_9_NotBad"					;//To by�o dobre!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//Brutal!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//No, dalej!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Wyko�cz go!
	Ooh01						=	"SVM_9_Ooh01"					;//Uwa�aj!
	Ooh02						=	"SVM_9_Ooh02"					;//Paruj!
	Ooh03						=	"SVM_9_Ooh03"					;//Cholera, to bola�o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Wynocha z mojego ��ka!
	Awake						= "SVM_9_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Wyja�ni�e� zatem spraw� z dow�dc�.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Ojciec Parlan uwolni� ci� od twoich grzech�w.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Odwiedzi�e� zatem Lee i za�atwi�e� spraw�.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Podnosisz bro� na owce? Pewnie trudno ci by�o o bardziej bezbronne stworzenie!?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Z takimi jak ty nie chc� mie� nic wsp�lnego!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Nie chc� mie� nic wsp�lnego ze z�odziejami!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//I ty chcesz by� paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Naprawd� nale�ysz do stra�y miejskiej? Lordowi Andre si� to nie spodoba!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Id� do Lorda Andre, p�ki jeszcze mo�esz.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Udaj si� do Ojca Parlana. Otrzymasz od niego pokut�!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee si� o tym dowie... Zap�acisz za to!
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Kapitan Garond b�dzie bardzo niezadowolony. Lepiej z nim porozmawiaj, zanim stanie si� co� jeszcze gorszego.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygra�e� zatem. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//S�dz�, �e wiesz ju�, kogo masz przed sob�. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//To znowu ty? Chcesz jeszcze raz si� ze mn� spr�bowa�, czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 sztuk z�ota.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...trudno mi w to uwierzy�...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...nie wiem, czy mo�na by� tego pewnym...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...przecie� on wiedzia� ju� o tym wcze�niej...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...ju� nie wiem, w co mam wierzy�...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...nie rozumiem w og�le, czym on si� tak przejmuje...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...nie potrzebuj� jeszcze wi�cej k�opot�w...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...dosz�o do mnie to i owo...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...lepiej zostawi� to w spokoju...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...nie mo�na wierzy� we wszystko, co si� s�yszy...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...ode mnie tego nie dosta�...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...tak mi si� w�a�nie wydawa�o...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...mnie i tak nikt nie s�ucha...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...nie zas�u�y� na co� takiego...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...nie m�w, �e o tym nie wiesz...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...to by�o przecie� jasne...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...sk�d ty to masz...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...tak dalej by� nie mo�e...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...mam w�asne zdanie na ten temat...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...by�o dok�adnie tak, jak m�wisz...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...nie s�dz�, �eby w tej sprawie co� si� zmieni�o...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...s�ysz� o tym po raz pierwszy...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...mo�emy jedynie przeczeka�...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...wiedzia�em, �e pojawi� si� problemy...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...czemu nikt mnie nie s�ucha...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...ucieka�, jakby goni� go sam Beliar...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...w ko�cu i tak go oczywi�cie dorwali�my...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...trzeba zdecydowanie i silnie uderzy� w sam �rodek...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...niekt�rzy nie zdaj� sobie w og�le sprawy ze swoich grzech�w...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...taka jest bowiem wola Innosa
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...jego czyny by�y sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Wr�� do mnie, kiedy nabierzesz wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_9_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_9_MARKT"						;//Znajdujesz si� teraz na targowisku.
	GALGEN						= "SVM_9_GALGEN"					;//Znajdujesz si� teraz przed koszarami na placu wisielc�w.
	KASERNE						= "SVM_9_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_9_HAFEN"						;//Znajdujesz si� w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Dok�d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Kiedy b�dziesz przed �wi�tyni�, skr�� w lewo i id� potem wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Je�eli staniesz plecami do �wi�tyni i potem p�jdziesz w lewo obok knajpy, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Id� od strony targowiska, wzd�u� mur�w miejskich, a dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Koszary znajduj� si� w tym du�ym budynku. Wejd� po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Przejd� po prostu obok koszar, a powiniene� doj�� do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Przejd� po prostu wzd�u� koszar, a powiniene� doj�� do targowiska.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, to dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nabrze�u ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaaaahrrrrrr!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Co to za maskarada? Ubierz si� jak cz�owiek.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Za�� pancerz!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Pracujesz dla kr�la, dlatego te� nosisz jego pancerz! Przebierz si�!
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz si�!
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj si� st�d!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//A teraz dostaniesz, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Trzeba by�o si� tu nie pokazywa�, piracie!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_10_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//To znowu TY!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Za�atwi� ci�!
	DieMonster					=	"SVM_10_DieMonster"					;//Znowu jedna z tych g�upich bestii!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Ty ma�y, parszywy z�odzieju!
	HandsOff					=	"SVM_10_HandsOff"					;//Zabieraj �apy!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Ta bestia z�era nasze owce!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//A ten stw�r czego tu chce?!
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//No, teraz to mnie wkurzy�e�!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Z niekt�rymi po prostu nie mo�na si� dogada� w normalny spos�b...
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Czego tam szuka�e�, co?!
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Gi�!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Cholerny bydlak...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//No, koniec z tob�, bestio!
	ThiefDown					=	"SVM_10_ThiefDown"					;//Trzymaj na przysz�o�� �apy z dala od moich rzeczy, jasne?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Na przysz�o�� trzymaj �apy przy sobie!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Nigdy wi�cej nie podno� r�ki na nasze owce!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//G�upie stworzenie!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Nie pr�buj tego jeszcze raz, ch�opczyku!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Niech to b�dzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Wstawaj i wyno� si� st�d!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Nie chc� ci� wi�cej tam widzie�, zrozumiano?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Je�eli kto� tu rozdziela ciosy, to jestem to ja, zrozumiano?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_10_RunAway"						;//Cholera! Trzeba ucieka�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALARM!
	Guards						=	"SVM_10_Guards"					;//STRA�!
	Help						=	"SVM_10_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//No! Tak nale�y obchodzi� si� z bestiami!
	GoodKill					= 	"SVM_10_GoodKill"				;//Zas�uguje na to!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//Jeszcze si� spotkamy!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Wyno� si�!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Zabieraj si� st�d!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//Co si� dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Ty frajerze, nawet z�ota nie masz!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Wezm� twoj� bro� na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//Lepiej uwa�aj! Nast�pnym razem ci przy�o��.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//Znowu chcesz w mord�?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Sko�cz wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Chcesz dosta�? Natychmiast przesta�!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Od�� wreszcie t� cholern� bro�!
	WiseMove					=	"SVM_10_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_10_OhMyHead"				;//O rany, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_10_GoodVictory"				;//Ale mu pokaza�e�!
	NotBad						= 	"SVM_10_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//Bogowie! Co za brutal...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Wal z ca�ej si�y!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Poka� mu!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Wyko�cz go!
	Ooh01						=	"SVM_10_Ooh01"					;//Bro� si�!
	Ooh02						=	"SVM_10_Ooh02"					;//Oddaj cios!
	Ooh03						=	"SVM_10_Ooh03"					;//Uuu, to musia�o bole�!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//Cholera, co to by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Wynocha z mojego ��ka!
	Awake						= "SVM_10_Awake"						;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Za�atwi�e� zatem spraw� z kapitanem.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Opowiedzia�e� zatem Ojcu Parlanowi o swych czynach.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//M�wi�, �e Lee uda�o si� za�atwi� ca�� spraw�.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to ju� po prostu szczyt wszystkiego! Wyno� si�!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Jeste� jakim� oprychem - lepiej st�d znikaj!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Przekl�ty z�odziej! Gardz� takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Wydawa�o mi si�, �e od paladyna mo�na oczekiwa� czego� wi�cej. Lord Hagen b�dzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//�e takich jak ty w og�le przyjmuj� do stra�y miejskiej! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre dowie si� o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Ojciec Parlan b�dzie w�ciek�y!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Odpowiesz za to przed Lee!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Kapitan Garond nie b�dzie zadowolony, kiedy o tym us�yszy! Zap�acisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Masz ca�kiem niez�e uderzenie... Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//Jeszcze jakie� pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 sztuk z�ota.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodzi�o...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...nikt nie chce o tym s�ysze�...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...w ko�cu to by�a jego decyzja...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...trzymam si� od tego z daleka...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...du�o by mnie to kosztowa�o...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...nie musisz mi tego m�wi�...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...widzi i s�yszy si� to, i owo...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...mog� ci opowiedzie� takich rzeczach...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...nie mo�na na tym polega�...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...sam tak m�wi�em...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...tego jest wi�cej, wierz mi...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...ci�gle to samo...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...nie m�w, �e to nieprawda...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...wcze�niej czy p�niej musia�o si� tak zdarzy�...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...powinien by� m�drzejszy...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...to si� nigdy nie zmieni...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...to �adna tajemnica...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...�adna wielka sprawa...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...on my�li, �e to takie �atwe...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...nikt nie chce tego s�ucha�...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...trzeba po prostu s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...gdyby to zale�a�o od nas, sprawy potoczy�yby si� inaczej...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...musi po prostu wi�cej �wiczy�...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...co on wie o s�u�bie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...�cie�ka cnoty jest d�uga i kamienista...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co z�e...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_10_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_10_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_10_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_10_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_10_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Dok�d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przej�ciem, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Kiedy znajdziesz si� przed �wi�tyni�, p�jd� w lewo i potem wzd�u� mur�w, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Je�eli id�c od strony targowiska, b�dziesz szed� wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Id� wzd�u� koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Id� po prostu wzd�u� koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wej�� po schodach.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nadbrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaarhhh!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Je�eli jeste� jednym z nas, powiniene� nosi� nasz str�j.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Skoro dosta�e� kr�lewski pancerz, no� go!
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Odrzucaj�c tog�, odrzucasz Innosa. Zastan�w si� nad tym.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Nie sta� ci� nawet na pancerz - dlaczego mia�bym z tob� rozmawia�?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Ty parszywy bandyto!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Ty parszywy piracie!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//Czekaj!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_11_Weather"						;//N�dzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Wi�c w ko�cu i tak ci� dorwa�em!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Teraz kolej na ciebie!
	DieMonster					=	"SVM_11_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Parszywy z�odziej! Czekaj tylko...
	HandsOff					=	"SVM_11_HandsOff"					;//Zabieraj �apy!
	SheepKiller					=	"SVM_11_SheepKiller"					;//To cholerne bydl� zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Ten przekl�ty potw�r z�era nasze owce!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Bestie nie maj� tu prawa wst�pu!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Czekaj tylko, ty draniu!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Sam si� o to prosi�e�!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Wi�c b�d� ci� musia� st�d WYKOPA�!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Co ty tam robi�e�, co?!
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Gi�, bydlaku!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Koniec z tob�, paskudo!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//Na przysz�o�� trzymaj si� z dala od cudzej w�asno�ci!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Nie r�b tego nigdy wi�cej! To s� nasze owce!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Nigdy wi�cej ze mn� nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//A teraz wyno� si�!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Tu si� nie walczy, zrozumiano? Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_11_RunAway"						;//Cholera! Znikam st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALARM!
	Guards						=	"SVM_11_Guards"						;//STRA�!
	Help						=	"SVM_11_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_11_GoodKill"					;//No, daj �wini na co zas�uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//St�j, padalcu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Czego tu chcesz?! Odejd�!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//No, zmywaj si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Ej ty! Czego tam szukasz!
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//Czego u diab�a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Z�oto! Przyda mi si�...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Nie masz z�ota?!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Wezm� twoj� bro� na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Hej! Uwa�aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//Ci�gle ci ma�o?
	StopMagic					=	"SVM_11_StopMagic"					;//Trzymaj si� ode mnie z daleka z t� swoj� magi�!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Sko�cz z tymi czarami! Co� nie tak z twoim s�uchem?!
	WeaponDown					=	"SVM_11_WeaponDown"					;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Og�uch�e� czy co?! Powtarzam: od�� bro�!
	WiseMove					=	"SVM_11_WiseMove"					;//Widzisz, to nie by�o takie trudne.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//Jeszcze zobaczymy...
	OhMyHead					=	"SVM_11_OhMyHead"					;//O rany, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//Ach, wreszcie co� si� dzieje!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//Porozwalaj� sobie �by...
	GoodVictory					=	"SVM_11_GoodVictory"					;//Zas�u�y� sobie na to!
	NotBad						= 	"SVM_11_NotBad"						;//Ca�kiem nie�le...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//Ale brutal...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Tak to si� powinno robi�!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Na co czekasz?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//I o to chodzi!
	Ooh01						=	"SVM_11_Ooh01"						;//Nie daj mu si�!
	Ooh02						=	"SVM_11_Ooh02"						;//Poka� mu, kto tu rz�dzi!
	Ooh03						=	"SVM_11_Ooh03"						;//O cholera!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Wynocha z mojego ��ka!
	Awake						= "SVM_11_Awake"							;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Podobno by�e� u kapitana i wszystko za�atwi�e�.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Pono� poszed�e� do Ojca Parlana, by odkupi� swe grzechy.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//M�wi�, �e by�e� u Lee i wszystko za�atwi�e�.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Tak po prostu szlachtowa� nasze owce! Spadaj st�d, gnido!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Nie gadam z takimi jak ty!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Zejd� mi z oczu, parszywy z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Jeste� zaka�� swojego zakonu! Lord Hagen b�dzie w�ciek�y!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Ha�bisz dobre imi� stra�y miejskiej! Lord Andre da ci nauczk�!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre dowie si� o twoich czynach!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Ojciec Parlan nie b�dzie zbyt szcz�liwy, gdy si� o tym dowie!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee da ci popali�! I na co ci to by�o?
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Kapitan Garond na pewno za��da od ciebie wyja�nie�!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Dobrze ju�, dobrze, wygra�e�. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//Mam ci znowu pokaza�, kto tu jest szefem?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Chyba chcesz mnie znowu sprowokowa�...
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 sztuk z�ota.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 sztuk z�ota.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 sztuk z�ota.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 sztuk z�ota.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 sztuk z�ota.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 sztuk z�ota.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 sztuk z�ota.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 sztuk z�ota.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 sztuk z�ota.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 sztuk z�ota.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 sztuk z�ota.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 sztuk z�ota.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 sztuk z�ota.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 sztuk z�ota.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 sztuk z�ota.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 sztuk z�ota.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 sztuk z�ota.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 sztuk z�ota.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 sztuk z�ota.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 sztuk z�ota.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 sztuk z�ota.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 sztuk z�ota.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 sztuk z�ota.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 sztuk z�ota.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 sztuk z�ota.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 sztuk z�ota.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 sztuk z�ota.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//...naprawd� tak my�lisz...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//...wszystko jest mo�liwe...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//...powinien by� m�drzejszy...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//...jakby�my mieli nie do�� problem�w...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//...kto ci to powiedzia�...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//...przez to b�dzie jeszcze wi�cej k�opot�w...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//...ludzie m�wi� r�ne rzeczy...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//...ja bym tego nie zrobi�...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//...to wszystko tylko plotki...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//...lepiej uwa�a�, co si� komu m�wi...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//...mog�em ci to powiedzie� wcze�niej...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//...nikt mnie nigdy nie pyta o zdanie...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//...�al biedaka...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//...to nic nowego...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//...to przecie� oczywiste...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//...nie musisz mnie o to pyta�...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//...tak nie mo�e dalej by�...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//...i tak wiesz, co o tym s�dz�...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//...to dok�adnie moje s�owa...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//...nic si� w zwi�zku z tym nie zmieni...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//...czemu nie dosz�o to do mnie wcze�niej...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//...poczekajmy, co si� stanie...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//...niekt�re problemy rozwi�zuj� si� same...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//...nie chc� o tym s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//...by� w sztok pijany...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//...nie pozwol� si� tak traktowa�...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//...wszyscy uciekali jak zaj�ce, by�em zupe�nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//...tak m�wi� pisma...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//...zawsze dzia�am w imieniu Innosa...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//...nie wolno narusza� boskiego porz�dku...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_11_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_11_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_11_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_11_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_11_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Dok�d chcesz si� uda�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Kiedy znajdziesz si� przed �wi�tyni�, skr�� w lewo i id� wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Id�c od strony �wi�tyni, skr�� w lewo ko�o knajpy, a dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Id�c wzd�u� mur�w miejskich od strony targowiska, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Koszary to ten du�y budynek. Wystarczy wej�� po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Przejd� obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Id� w d� uliczk� odchodz�c� od placu wisielc�w, to dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Przejd� obok koszar, to dostaniesz si� na targowisko.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Koszary to ten du�y budynek. Dostaniesz si� do niego po schodach.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, to dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nabrze�u, w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Za�� nasz pancerz, a wtedy z tob� porozmawiam. A teraz zje�d�aj.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Powiniene� nosi� kr�lewski pancerz! Odsu� si�!
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz si�!
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Nie masz nawet pancerza. Zabieraj si� st�d!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Znowu jaki� bandyta.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIRACI!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_12_Weather"					;//Kiepska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Teraz ci� mam!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Trzeba by�o tu nie przychodzi�!
	DieMonster					=	"SVM_12_DieMonster"					;//No chod�, parszywa bestio!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Czekaj tylko, ty �mierdz�cy z�odzieju!
	HandsOff					=	"SVM_12_HandsOff"					;//Zabieraj st�d �apy!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Odejd� od naszych owiec, ty przekl�ta bestio!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Po�a�ujesz tego!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Ostrzega�em ci�!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Powiedzia�em WON!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hej! Co ty tam robi�e�?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Przesta�! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Rozerw� ci� na strz�py!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Koniec z tob�...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//To mnie kr�ci!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//Kolejne bydl� za�atwione!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Ostrzegam ci�! Nie pr�buj tego ponownie, ty przekl�ty z�odzieju!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//Trzymaj w przysz�o�ci �apy z dala od rzeczy, kt�re do ciebie nie nale��!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//I trzymaj si� z dala od naszych owiec!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Przekl�ty potw�r!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Nigdy nie wa� si� mnie atakowa�!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Ostrzega�em ci�!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//A teraz wyno� si�!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Nie chc� ci� tu wi�cej widzie�, jasne?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Tu si� nie walczy, zapami�taj to sobie dobrze!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Nie zr�b czego� g�upiego!
	RunAway						= 	"SVM_12_RunAway"						;//Wynosz� si� st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALARM!
	Guards						=	"SVM_12_Guards"					;//STRA�!
	Help						=	"SVM_12_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//Ode�lemy te bestie do otch�ani!
	GoodKill					= 	"SVM_12_GoodKill"				;//Dobrze! Poka� draniowi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//Dorw� ci� jeszcze!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Nie masz tu nic do roboty!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//No, wynocha!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Co ty kombinujesz? Czego tam szukasz?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//Czego u diab�a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Dobrze, �e masz przy sobie przynajmniej troch� z�ota...
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Nawet z�ota nie ma?!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Chyba wezm� sobie twoj� bro�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//Nie pr�buj tego ponownie, ch�opcze!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//Ci�gle ci ma�o?
	StopMagic					=	"SVM_12_StopMagic"				;//Przesta� z tymi czarami!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Ostatnie ostrze�enie - sko�cz z t� magi�!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Od�� to, albo pogadamy inaczej!
	WiseMove					=	"SVM_12_WiseMove"				;//Hej, nie jeste� wcale taki g�upi, na jakiego wygl�dasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//Nie pr�buj tego ponownie...
	OhMyHead					=	"SVM_12_OhMyHead"				;//Och, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//Teraz b�dzie zabawa...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//O bogowie...
	GoodVictory					=	"SVM_12_GoodVictory"			;//Niech to b�dzie dla niego nauczka...
	NotBad						= 	"SVM_12_NotBad"					;//To by�o dobre!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//Cholerny brutal!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//R�bnij go!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Nie przestawaj!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Wyko�cz go!
	Ooh01						=	"SVM_12_Ooh01"					;//Uwa�aj!
	Ooh02						=	"SVM_12_Ooh02"					;//Paruj! Paruj!
	Ooh03						=	"SVM_12_Ooh03"					;//Cholera, to bola�o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//Co to by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Wynocha z mojego ��ka!
	Awake						= "SVM_12_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Zatem kapitan wyja�ni� spraw�.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Ojciec Parlan uwolni� ci� wi�c od twoich grzech�w.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Widzia�e� si� zatem z Lee i zaj��e� si� spraw�.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Mordujesz owce? Przypuszczam, �e bardziej bezbronnej ofiary nie mog�e� sobie znale��?!
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Z takimi jak ty nie chc� mie� nic wsp�lnego!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Nie zadaj� si� ze z�odziejami!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//I ty chcesz by� paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Naprawd� nale�ysz do stra�y miejskiej? Lordowi Andre si� to nie spodoba!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Id� do Lorda Andre, p�ki jeszcze mo�esz.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Id� do Ojca Parlana. Pomo�e ci zmaza� twoje grzechy!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee o tym us�yszy, a wtedy b�dziesz musia� zap�aci�...
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Kapitan Garond nie b�dzie zadowolony. Lepiej z nim porozmawiaj, zanim b�dzie jeszcze gorzej!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygra�e�. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//Chyba ju� wiesz, z kim masz do czynienia. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//To znowu ty? Chcesz jeszcze si� raz ze mn� spr�bowa�, czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 sztuk z�ota.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodzi�o...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//...nikt nie chce wiedzie�...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//...w ko�cu to by�a jego decyzja...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//...trzymam si� od tego z daleka...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//...du�o by mnie to kosztowa�o...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//...nie musisz mi tego m�wi�...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//...widzi i s�yszy si� to, i owo...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//...mog� ci opowiedzie� o takich rzeczach...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//...nie mo�na na to liczy�...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//...sam tak m�wi�em...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//...tego jest wi�cej, wierz mi...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//...ci�gle to samo...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//...nie m�w, �e to nieprawda...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//...wcze�niej czy p�niej musia�o si� tak zdarzy�...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//...powinien by� m�drzejszy...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//...to si� nigdy nie zmieni...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//...to �adna tajemnica...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//...�adna wielka sprawa...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//...on my�li, �e to takie �atwe...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//...nikt nie chce tego s�ucha�...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...trzeba po prostu s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//...gdyby to zale�a�o od nas, sprawy potoczy�yby si� inaczej...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//...musi po prostu wi�cej �wiczy�...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//...co on wie o s�u�bie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//...�cie�ka cnoty jest d�uga i kamienista...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co z�e...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_12_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_12_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_12_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_12_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_12_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Dok�d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przej�ciem, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie prowadz�ce do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Kiedy znajdziesz si� przed �wi�tyni�, p�jd� w lewo i potem wzd�u� mur�w, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Je�eli id�c od strony �wi�tyni, skr�cisz przy knajpie w lewo, dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Je�eli id�c od strony targowiska, b�dziesz szed� wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejd� po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Id� po prostu wzd�u� koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Id� od strony placu wisielc�w w d� uliczk�, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Id� po prostu wzd�u� koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wej�� po schodach.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Id� od strony muru przy nadbrze�u w g�r� ulic� portow�, a dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz si�!
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Je�li chcesz ze mn� rozmawia�, to za�� pancerz.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//�o�nierz nosi pancerz swojego kr�la. NIC innego! Przebierz si�!
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz si�!
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Nie sta� ci� nawet na pancerz. Nie b�d� rozmawia� z takim s�abeuszem.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Dostan� ci�, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Dostan� ci�, piracie!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_13_Weather"					;//Jaka� n�dzna ta pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Teraz ci� dorw�!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Rozerw� ci� na kawa�ki!
	DieMonster					=	"SVM_13_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Parszywy z�odziej! Czekaj tylko...
	HandsOff					=	"SVM_13_HandsOff"					;//Zabieraj �apy!
	SheepKiller					=	"SVM_13_SheepKiller"				;//To cholerne bydl� zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Ten przekl�ty potw�r z�era nasze owce!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Dobra bestia to martwa bestia!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Czekaj tylko, ty draniu!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Nie chcesz i��? Dobrze!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Czego tam szuka�e�?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Gi�, bydlaku!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Zas�u�y�e� na to, gnido!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//Od tej chwili trzymaj �apy z dala od rzeczy, kt�re do ciebie nie nale��!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Nie r�b tego nigdy wi�cej! To s� nasze owce!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//G�upi potw�r!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Nigdy wi�cej ze mn� nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//A teraz zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Tu si� nie walczy, zrozumiano? Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Nie r�b mi krzywdy!
	RunAway						= 	"SVM_13_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALARM!
	Guards						=	"SVM_13_Guards"					;//STRA�!
	Help						=	"SVM_13_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_13_GoodKill"				;//No, daj �wini na co zas�uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//Uciekaj, najszybciej jak tylko potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Czego tu chcesz?! Odejd�!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//No, wyno� si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Ej ty! Czego tam szukasz!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//Czego u diab�a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Ty biedny frajerze, nawet z�ota nie masz!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Wezm� twoj� bro� na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//Uwa�aj! Nast�pnym razem ci przy�o��.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Ci�gle ci ma�o?!
	StopMagic					=	"SVM_13_StopMagic"				;//Sko�cz z t� magi�!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Chcesz dosta�! Przesta� w tej chwili!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Od�o�ysz wreszcie t� przekl�t� bro�?!
	WiseMove					=	"SVM_13_WiseMove"				;//Dobra decyzja!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_13_OhMyHead"				;//O rany, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_13_GoodVictory"			;//Pokaza�e� mu, kto tu rz�dzi!
	NotBad						= 	"SVM_13_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//No, wal!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Poka� mu!
	Ooh01						=	"SVM_13_Ooh01"					;//Trzymaj si�!
	Ooh02						=	"SVM_13_Ooh02"					;//Uwa�aj!
	Ooh03						=	"SVM_13_Ooh03"					;//Oj! To by�o mocne!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Wynocha z mojego ��ka!
	Awake						= "SVM_13_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Poszed�e� wi�c do kapitana i wszystko za�atwi�e�.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//By�e� wi�c u Ojca Parlana i opowiedzia�e� mu o swych przewinieniach.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Zobaczy�e� si� zatem z Lee i wyja�ni�e� spraw�.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Tak po prostu szlachtowa� nasze owce!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Zostaw mnie w spokoju, ty parszywa gnido!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Zostaw mnie, ty ma�y, n�dzny z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Jeste� ha�b� dla swego zakonu! Czekaj tylko, a� dowie si� o tym Lord Hagen!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Ha�bisz dobre imi� stra�y miejskiej! Lord Andre na pewno si� o tym dowie!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Czekaj, a� Lord Andre si� o tym dowie!
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Czekaj, a� dowie si� o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Lee na pewno o tym us�yszy...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Kapitan Garond na pewno si� o tym dowie!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Dobrze ju�, dobrze, jeste� lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//Przypuszczam, �e teraz ju� wiesz, kt�ry z nas jest tym silniejszym... Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Wydawa�o mi si�, �e chcesz mnie sprowokowa�. Zmieni�e� zdanie? Wolisz jednak POGADA�, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 sztuk z�ota.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodzi�o...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...nikt nie chce wiedzie�...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...w ko�cu to by�a jego decyzja...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...trzymam si� od tego z daleka...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...du�o by mnie to kosztowa�o...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...nie musisz mi tego m�wi�...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...widzi i s�yszy si� to i owo...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...mog� ci opowiedzie� o takich rzeczach...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...nie mo�na na tym polega�...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...sam tak m�wi�em...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...tego jest wi�cej, wierz mi...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...ci�gle to samo...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...nie m�w, �e to nieprawda...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...wcze�niej czy p�niej musia�o si� to zdarzy�...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...powinien by� wiedzie� lepiej...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...to si� nigdy nie zmieni...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...to �adna tajemnica...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...�adna wielka sprawa...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...on my�li, �e to takie �atwe...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...nikt nie chce tego s�ucha�...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...trzeba po prostu s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...gdyby to zale�a�o od nas, sprawy potoczy�yby si� inaczej...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...musi po prostu wi�cej �wiczy�...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...co on wie o s�u�bie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...�cie�ka cnoty jest d�uga i kamienista...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co z�e...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_13_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_13_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_13_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_13_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_13_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Dok�d chcesz si� uda�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Id� od kowala przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Id� od kowala w d� ulic� portow�, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Sta� przed �wi�tyni�, id� na lewo wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Id�c od strony �wi�tyni, skr�� w lewo ko�o knajpy, a dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Id�c od strony targowiska, wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Koszary to ten du�y budynek. Dostaniesz si� do niego po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Przejd� po prostu obok koszar, a powiniene� doj�� do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Id� w d� uliczk� odchodz�c� od placu wisielc�w, to dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Po prostu zejd� po schodach na lewo od g��wnego wej�cia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Po prostu zejd� po schodach na prawo od g��wnego wej�cia, to dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Id�c od strony muru przy nadbrze�u, w g�r� ulic� portow�, dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaarhhhh!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju!
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Nie masz na sobie pancerza, id� go za�o�y�.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Powiniene� z dum� nosi� pancerz swego kr�la, a nie biega� w tych szmatach. Odejd�!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Dlaczego nie nosisz pancerza naszego zakonu?
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj si� st�d!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Ty pod�y bandyto!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Ty przekl�ty piracie!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_14_Weather"						;//N�dzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//W ko�cu ci� dopad�em!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Nadszed� tw�j czas!
	DieMonster					=	"SVM_14_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Czekaj tylko, ty ma�y z�odzieju!
	HandsOff					=	"SVM_14_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_14_SheepKiller"					;//To bydl� zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Ten przekl�ty potw�r z�era nasze owce!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Czekaj tylko, ty gnido!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Wi�c b�d� ci� musia� st�d WYKOPA�!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Co ty tam robi�e�, co?!
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Gi�, bydlaku!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//To tw�j koniec, padalcu!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//Trzymaj si� w przysz�o�ci z dala od rzeczy, kt�re nie powinny ci� interesowa�!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Nie r�b tego nigdy wi�cej! To s� nasze owce!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Nigdy wi�cej ze mn� nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//A teraz zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Tu si� nie walczy, zrozumiano? Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Zostaw mnie, prosz�!
	RunAway						= 	"SVM_14_RunAway"						;//Cholera! Znikam st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALARM!
	Guards						=	"SVM_14_Guards"						;//STRA�!
	Help						=	"SVM_14_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_14_GoodKill"					;//No, daj �wini na co zas�uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//St�j, gnido!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Czego tutaj szukasz? Odejd�!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//No, zmywaj si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Ej ty? Co ty tam robisz, co?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//Cholera, co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Z�oto! Dobrze... Przyda mi si�.
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Nawet nie masz z�ota?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Wezm� sobie twoj� bro�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Hej, uwa�aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//Ci�gle ci ma�o?
	StopMagic					=	"SVM_14_StopMagic"					;//Trzymaj si� ode mnie z daleka z t� swoj� magi�!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Przesta� z tymi czarami! Masz co� nie tak z uszami?!
	WeaponDown					=	"SVM_14_WeaponDown"					;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Nie s�yszysz mnie? Powtarzam: od�� bro�!
	WiseMove					=	"SVM_14_WiseMove"					;//Widzisz, to nie by�o takie trudne.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//Jeszcze o tym pogadamy...
	OhMyHead					=	"SVM_14_OhMyHead"					;//O rany, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//Wreszcie co� si� dzieje!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//Porozwalaj� sobie �by...
	GoodVictory					=	"SVM_14_GoodVictory"					;//Pokaza�e� mu, kto tu rz�dzi!
	NotBad						= 	"SVM_14_NotBad"						;//Ca�kiem nie�le...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//Co za brutal...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Tak trzymaj!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Na co czekasz?!
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Tak trzeba!
	Ooh01						=	"SVM_14_Ooh01"						;//Nie daj si�!
	Ooh02						=	"SVM_14_Ooh02"						;//Poka� mu, kto tu jest szefem!
	Ooh03						=	"SVM_14_Ooh03"						;//O cholera!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Wynocha z mojego ��ka!
	Awake						= "SVM_14_Awake"							;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Pono� by�e� u kapitana i wszystko wyja�ni�e�.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//By�e� zatem u Ojca Parlana i wyzna�e� mu swoje grzechy.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//M�wi�, �e poszed�e� do Lee i za�atwi�e� spraw�.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Tak po prostu zarzyna� nasze owce! Spadaj st�d, gnido!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Nie gadam z takimi jak ty!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Zejd� mi z oczu, parszywy z�odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Jeste� zaka�� swego zakonu! Lord Hagen b�dzie w�ciek�y!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Ha�bisz dobre imi� stra�y miejskiej! Lord Andre da ci nauczk�!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre dowie si� o twoich czynach!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Ojciec Parlan b�dzie bardzo niezadowolony!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Ju� Lee ci� nauczy... I po co ci to by�o?
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Kapitan Garond b�dzie ��da� wyja�nie�!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Dobrze ju�, dobrze, jeste� lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokaza�, kto tu jest szefem?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Znowu chcesz si� ze mn� zmierzy�?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 sztuk z�ota.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 sztuk z�ota.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 sztuk z�ota.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 sztuk z�ota.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 sztuk z�ota.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 sztuk z�ota.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 sztuk z�ota.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 sztuk z�ota.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 sztuk z�ota.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 sztuk z�ota.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 sztuk z�ota.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 sztuk z�ota.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 sztuk z�ota.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 sztuk z�ota.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 sztuk z�ota.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 sztuk z�ota.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 sztuk z�ota.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 sztuk z�ota.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 sztuk z�ota.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 sztuk z�ota.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 sztuk z�ota.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 sztuk z�ota.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 sztuk z�ota.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 sztuk z�ota.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 sztuk z�ota.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 sztuk z�ota.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 sztuk z�ota.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...nie wierz�...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...nie mo�na by� tego pewnym...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...ale on o tym wiedzia�...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...ju� nie wiem, komu ufa�...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...nie wiem, czym on si� tak denerwuje...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...i tak mam wystarczaj�co k�opot�w...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...a, s�ysza�em to i owo...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...nie chc� mie� z tym nic wsp�lnego...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...nie wolno wierzy� we wszystko, co si� s�yszy...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...ode mnie tego nie dosta�...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...ju� o tym my�la�em...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...nikt mnie nie pyta o zdanie...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...naprawd� na to nie zas�u�y�...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...nie m�w, �e o tym nie wiesz...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...to by�o oczywiste...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...sk�d to zatem masz...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...nie mo�e tak dalej by�...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...mam w�asne zdanie na ten temat...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...by�o tak, jak m�wisz...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...nie s�dz�, �eby co� si� zmieni�o...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...s�ysz� o tym po raz pierwszy...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...mo�emy tylko siedzie� i czeka�...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...wiedzia�em, �e b�dzie z tym problem...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...wi�c czemu nie chc� mnie s�ucha�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...ucieka�, jakby goni� go sam Beliar...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...w ko�cu i tak go oczywi�cie dorwali�my...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...trzeba si� tym zaj�� i uporz�dkowa� sprawy...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...niekt�rzy nawet nie wiedz�, jak bardzo grzesz�...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...taka jest bowiem wola Innosa...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...jego czyny by�y sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� za dobry.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_14_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_14_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_14_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_14_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_14_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Dok�d chcesz si� uda�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Id� od ku�ni przez przej�cie, a dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Id� od ku�ni w d� ulic� portow�, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Stoj�c przed �wi�tyni�, id� na lewo wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Id�c od strony �wi�tyni, skr�� w lewo ko�o knajpy, a dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Id�c od targowiska wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Przejd� po prostu obok koszar, a powiniene� doj�� do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Id�c w d� uliczk� odchodz�c� od placu wisielc�w, dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Je�li zejdziesz po schodach na lewo od g��wnego wej�cia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Schodz�c po schodach na prawo od g��wnego wej�cia, dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Id�c od strony muru wzd�u� nabrze�a w g�r� ulic� portow�, dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//To ubranie nie pasuje na ciebie. Wida� wyra�nie, �e masz co� do ukrycia. A teraz zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Je�eli chcesz ze mn� rozmawia�, musisz mie� na sobie pancerz.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Powiniene� by� dumny z przynale�no�ci do armii, a nie biega� w tych szmatach. Id� si� przebra�!
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz si�!
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj si� st�d!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Gi�, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Gi�, piracie!
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

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nie dzia�a.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, z�ama� si�...
	NeedKey					= 	"SVM_15_NeedKey"					;//Potrzebuj� do tego klucza...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Nie mam ju� wytrych�w...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Nie znam si� na otwieraniu zamk�w.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Posprz�tanie wszystkich komnat zajmie wieki!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm... Nie mam ani klucza, ani wytrychu.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Bez w�a�ciwego klucza nigdy tego nie otworz�!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Przyda�oby si� par� wytrych�w!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Nigdy tego nie otworz�!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Czym?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hm... Nie...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Niczego tu nie znajd�...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nic tu nie ma...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nie ma czego pl�drowa�...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaaarhhh!
	Awake					=	"SVM_15_Awake"						;//(budzi si�)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Hm... A wi�c tam jest twoja kryj�wka. Cholernie daleko. Chyba b�d� potrzebowa� statku...
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innosie, obdarz mnie sw� �ask� i oczy�� t� kapliczk�.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innosie, obdarz mnie sw� �ask� i tak dalej... No, to chyba ostatni raz.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ach... Ksi�ga zosta�a otwarta. W �rodku jest klucz i jaki� list.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Otw�rz si�!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Pohandlujmy.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Poka� mi swoje towary.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Poka� mi, co masz.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Rozumiem.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ach. S�dz�, �e co� znalaz�em.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Nie rozumiem.
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Nie potrafi� tego przeczyta�.
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//Och, ch�opie, brr!
	HUI						=	"SVM_15_Addon_HUI"						;//Hahaaa!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Co wiesz o pr�bie zab�jstwa Estebana?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//A co do pr�by zab�jstwa Estebana...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Zabij� tych zdrajc�w.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Chc� znale�� tych ludzi, by wyst�pi� przeciwko Estebanowi.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Potrzebuj� ci� w kopalni.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Przyzywam ci�, Quarhodronie, pradawny przyw�dco kasty wojownik�w!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Hmm... To tutaj nie dzia�a.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Co musz� wiedzie� o wydobyciu z�ota?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Ach, ksi�ga rozrachunkowa Francisa. Wygl�da na to, �e ten cz�owiek napycha sobie z�otem kieszenie.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_16_Weather"						;//N�dzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//W ko�cu i tak ci� dorw�!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Wybi�a twoja godzina!
	DieMonster					=	"SVM_16_DieMonster"					;//Znowu jedna z tych przekl�tych bestii!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Parszywy z�odziej! Czekaj tylko...
	HandsOff					=	"SVM_16_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_16_SheepKiller"					;//To bydl� zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Ten cholerny potw�r po�era nasze owce!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Czekaj tylko, gnido!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Zatem b�d� musia�a ci� st�d WYKOPA�!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Co ty tam robi�e�, co?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Gi�, bydlaku!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//To tw�j koniec, padalcu!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//Na przysz�o�� trzymaj si� z dala od rzeczy, kt�re nie powinny ci� interesowa�!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Nigdy wi�cej tego nie r�b! To s� nasze owce!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Nigdy wi�cej ze mn� nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//A teraz zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�a!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Tu si� nie walczy, zrozumiano? Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Nie r�b mi krzywdy!
	RunAway						= 	"SVM_16_RunAway"						;//Wynosz� si� st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALARM!
	Guards						=	"SVM_16_Guards"					;//STRA�!
	Help						=	"SVM_16_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//Dobra robota!
	GoodKill					= 	"SVM_16_GoodKill"				;//No, daj �wini na co zas�uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//St�j, tch�rzu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Czego tutaj szukasz? Odejd�!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//No, zabieraj si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hej ty! Czego ty tam szukasz?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//Co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Ty biedny frajerze, nawet z�ota nie masz!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Lepiej zaopiekuj� si� twoj� broni�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//Hej, uwa�aj! Jeszcze raz i ci przy�o��!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Ci�gle ci ma�o?!
	StopMagic					=	"SVM_16_StopMagic"				;//Przesta� z tymi czarami!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Chcesz dosta�? Przesta� w tej chwili!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Od�o�ysz w ko�cu t� cholern� bro�?!
	WiseMove					=	"SVM_16_WiseMove"				;//M�dra decyzja...
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_16_OhMyHead"				;//O bogowie, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_16_GoodVictory"			;//Pokaza�e� mu, kto tu rz�dzi!
	NotBad						= 	"SVM_16_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Rozwal go!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Poka� mu!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Daj mu popali�!
	Ooh01						=	"SVM_16_Ooh01"					;//Oddaj mu!
	Ooh02						=	"SVM_16_Ooh02"					;//Uwa�aj!
	Ooh03						=	"SVM_16_Ooh03"					;//Och! To musia�o bole�!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Wyno� si� z mojego ��ka!
	Awake						= "SVM_16_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Poszed�e� wi�c do kapitana i oczy�ci�e� si� z zarzut�w.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//By�e� zatem u Ojca Parlana i wyzna�e� mu swoje grzechy.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee rozwi�za� ten problem.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Dobre.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Nie mo�esz tak po prostu zabija� naszych owiec! Odejd�!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Jeste� brutalnym oprychem. Nie chc� mie� z tob� nic wsp�lnego.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Nie rozmawiam ze z�odziejami - a teraz odejd� st�d!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Twoje zachowanie nie jest zbyt honorowe. Lordowi Hagenowi to si� nie spodoba!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Twe zachowanie ha�bi dobre imi� stra�y miejskiej! Lord Andre za��da wyja�nie�!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre dowie si� o twoich czynach!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Post�pi�e� niew�a�ciwie. Id� do Ojca Parlana i �a�uj za swoje grzechy!
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee si� o tym dowie. Zostaniesz ukarany!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Kapitan Garond za��da wyja�nie�!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 sztuk z�ota.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...doprawdy? To interesuj�ce...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...nie wierz� w to...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...m�j m�� uwa�a inaczej...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...daj spok�j, nie opowiadaj mi takich rzeczy...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...naprawd�, sama widzia�am...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...nie m�w...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...nikomu tego nie powtarzaj...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...przysz�o nam �y� w niedobrych czasach...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...kto to opowiada takie rzeczy...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...gdybym sama tego nie widzia�a...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...kto� musi pracowa�...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...s�ysza�am co innego...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...tak, to bardzo typowe...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...nie potrafi niczego zatrzyma� dla siebie...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...lepiej by by�o, gdyby si� przymkn��...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...i pracuje niemal przez ca�y dzie�...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...nie mog� zajmowa� si� wszystkim i wszystkimi...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...on po prostu za du�o gada...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...tajemnica, o kt�rej wszyscy wiedz�...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...teraz ka�dy ju� o tym wie...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...niczego jej ju� nie powiem...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...a b�dzie jeszcze gorzej...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...to przecie� okropne...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...zawsze to powtarza�am...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� ju� zbyt dobry.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Jeste� teraz w ni�szej cz�ci miasta.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_16_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_16_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_16_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_16_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_16_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Dok�d chcesz si� uda�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Id�c od ku�ni przez przej�cie, dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Id�c od ku�ni w d� ulic� portow�, dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Jeste� przed �wi�tyni�, id� na lewo wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Id�c od strony �wi�tyni, skr�� w lewo ko�o knajpy, a dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Id�c od strony targowiska, wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Koszary to ten du�y budynek. Wejd� po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Przejd� po prostu obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Id� w d� uliczk� odchodz�c� od placu wisielc�w, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Przejd� po prostu obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Ten du�y budynek to koszary. Wejd� po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Zejd� w d� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Zejd� w d� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Id�c w g�r� ulic� portow�, od strony muru przy nadbrze�u, dojdziesz do dolnej cz�ci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaarhhh!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Ubierz si� odpowiednio. Nie chc�, by widziano mnie z kim� takim.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//BANDYTA!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//PIRAT!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Niech �yje Kr�l!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Chwa�a Innosowi!
	Weather						= 	"SVM_17_Weather"						;//N�dzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//W ko�cu ci� dopad�am!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Wybi�a twoja godzina!
	DieMonster					=	"SVM_17_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Parszywy z�odziej! Czekaj tylko...
	HandsOff					=	"SVM_17_HandsOff"					;//�apy precz!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Ten bydlak zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Ten cholerny potw�r z�era nasze owce!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Czekaj tylko, gnido!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Sam tego chcia�e�!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Zatem b�d� musia�a ci� st�d WYKOPA�!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Co TY tam robi�e�, co?!
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Przestaniecie w ko�cu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Gi�, bydlaku!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//To tw�j koniec, padalcu!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Nigdy wi�cej nie pr�buj mnie okra��!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//Na przysz�o�ci trzymaj si� z dala od rzeczy, kt�re nie powinny ci� interesowa�!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Nigdy wi�cej tego nie r�b! To s� nasze owce!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Gi�, morderco!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//G�upia bestia!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Nigdy wi�cej ze mn� nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Trzeba by�o mnie pos�ucha�!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//A teraz zabieraj si� st�d!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//I �ebym ci� ju� nigdy wi�cej tam nie przy�apa�a!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Tu si� nie walczy, zrozumiano? Niech to b�dzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Nie r�b mi krzywdy!
	RunAway						= 	"SVM_17_RunAway"						;//Wynosz� si� st�d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALARM!
	Guards						=	"SVM_17_Guards"					;//STRA�!
	Help						=	"SVM_17_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//Dobra robota!
	GoodKill					= 	"SVM_17_GoodKill"				;//No, daj �wini na co zas�uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//St�j, tch�rzu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Wyno� si� st�d!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Czego tutaj szukasz? Odejd�!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//No, zabieraj si�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hej ty! Czego ty tam szukasz?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//Co jest
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Dzi�ki za z�oto, m�j ty bohaterze!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Ty biedny frajerze, nawet z�ota nie masz!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Lepiej zaopiekuj� si� twoj� broni�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//Hej, uwa�aj! Jeszcze raz i ci przy�o��!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Ci�gle ci ma�o?!
	StopMagic					=	"SVM_17_StopMagic"				;//Przesta� z tymi czarami!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Chcesz dosta�? Przesta� w tej chwili!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Od�o�ysz w ko�cu t� cholern� bro�?!
	WiseMove					=	"SVM_17_WiseMove"				;//M�dra decyzja...
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//Zobaczymy nast�pnym razem...
	OhMyHead					=	"SVM_17_OhMyHead"				;//O bogowie, moja g�owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_17_GoodVictory"			;//Pokaza�e� mu, kto tu rz�dzi!
	NotBad						= 	"SVM_17_NotBad"					;//Nie�le...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Rozwal go!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Poka� mu!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Daj mu popali�!
	Ooh01						=	"SVM_17_Ooh01"					;//Oddaj mu!
	Ooh02						=	"SVM_17_Ooh02"					;//Uwa�aj!
	Ooh03						=	"SVM_17_Ooh03"					;//Och! To bola�o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//Co TO by�o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Wyno� si� z mojego ��ka!
	Awake						= "SVM_17_Awake"					;//(ziewni�cie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Poszed�e� wi�c do kapitana i oczy�ci�e� si� z zarzut�w.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//By�e� zatem u Ojca Parlana i wyzna�e� mu o swoje grzechy.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee rozwi�za� t� spraw� dla ciebie.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Dobre.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Nie mo�esz tak po prostu zabija� naszych owiec! Odejd�!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Jeste� brutalnym oprychem. Nie chc� mie� z tob� nic wsp�lnego.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Nie rozmawiam ze z�odziejami - wynocha!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Twoje zachowanie nie jest zbyt honorowe. Lordowi Hagenowi to si� nie spodoba!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Twoje zachowanie ha�bi dobre imi� stra�y miejskiej! Lord Andre za��da wyja�nie�!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre dowie si� o twych czynach!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Post�pi�e� niew�a�ciwie. Id� do Ojca Parlana i �a�uj za swoje grzechy!
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee si� o tym dowie. Zostaniesz ukarany!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Kapitan Garond za��da wyja�nie�!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 sztuk z�ota.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 sztuk z�ota.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 sztuk z�ota.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 sztuk z�ota.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 sztuk z�ota.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 sztuk z�ota.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 sztuk z�ota.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 sztuk z�ota.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 sztuk z�ota.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 sztuk z�ota.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 sztuk z�ota.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 sztuk z�ota.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 sztuk z�ota.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 sztuk z�ota.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 sztuk z�ota.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 sztuk z�ota.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 sztuk z�ota.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 sztuk z�ota.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 sztuk z�ota.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 sztuk z�ota.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 sztuk z�ota.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 sztuk z�ota.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 sztuk z�ota.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 sztuk z�ota.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 sztuk z�ota.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 sztuk z�ota.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 sztuk z�ota.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 sztuk z�ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...doprawdy? To interesuj�ce...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...nie wierz� w to...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...m�j m�� uwa�a inaczej...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...daj spok�j, nie opowiadaj mi takich rzeczy...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...naprawd�, sama widzia�am...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...nie m�w...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...nikomu tego nie powtarzaj...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...przysz�o nam �y� w niedobrych czasach...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...kto to opowiada takie rzeczy...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...gdybym sama tego nie widzia�a...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...kto� musi pracowa�...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...s�ysza�am co innego...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...tak, to bardzo typowe...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...nie potrafi niczego zatrzyma� dla siebie...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...lepiej by by�o, gdyby si� przymkn��...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...i pracuje niemal przez ca�y dzie�...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...nie mog� si� zajmowa� wszystkim i wszystkimi...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...on po prostu za du�o gada...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...tajemnica, o kt�rej wszyscy wiedz�...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...teraz ka�dy ju� o tym wie...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...niczego jej ju� nie powiem...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...a b�dzie jeszcze gorzej...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...to przecie� okropne...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...zawsze to powtarza�am...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Wr��, kiedy nabierzesz troch� wi�cej do�wiadczenia.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wi�cej, ni� mog� ci� nauczy�.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Nie mog� ci� ju� niczego nauczy�. Jeste� zbyt dobry.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Widzisz, ju� si� czego� nauczy�e�...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Jeste� teraz w dolnej cz�ci miasta.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Jeste� teraz w g�rnym mie�cie.
	TEMPEL						= "SVM_17_TEMPEL"					;//Jeste� teraz przy �wi�tyni.
	MARKT						= "SVM_17_MARKT"						;//Jeste� teraz na targowisku.
	GALGEN						= "SVM_17_GALGEN"					;//Jeste� teraz na placu wisielc�w.
	KASERNE						= "SVM_17_KASERNE"					;//To s� koszary.
	HAFEN						= "SVM_17_HAFEN"						;//Jeste� teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Dok�d chcesz si� uda�?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Przejd� przez wewn�trzn� bram�, a dojdziesz do dolnej cz�ci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Przy po�udniowej bramie znajduj� si� schody, kt�re prowadz� do bramy wewn�trznej. Za ni� zaczyna si� g�rne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Id�c od ku�ni przez przej�cie, dojdziesz do placu �wi�tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Id�c od ku�ni w d� ulic� portow�, dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Od placu �wi�tynnego odchodzi przej�cie, kt�re prowadzi do dolnej cz�ci miasta.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Jeste� przed �wi�tyni�, id� na lewo wzd�u� mur�w miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Id�c od strony �wi�tyni, skr�� w lewo ko�o knajpy, a dojdziesz do placu wisielc�w.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Id�c od strony targowiska, wzd�u� mur�w miejskich, dojdziesz do �wi�tyni.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Ten du�y budynek to koszary. Wejd� po schodach naprzeciwko hotelu.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Przejd� obok koszar, a dojdziesz do placu wisielc�w.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Id� w d� uliczk� odchodz�c� od placu wisielc�w, a dojdziesz do placu �wi�tynnego.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Przejd� obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Ten du�y budynek to koszary. Wejd� po schodach.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Zejd� po schodach na lewo od g��wnego wej�cia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Zejd� po schodach na prawo od g��wnego wej�cia, a dojdziesz do placu wisielc�w.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Id�c w g�r� ulic� portow� od strony muru przy nabrze�u, dojdziesz do dolnej cz�ci miasta.
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
	RunCoward    	= "SVM_19_RunCoward"    	;//Nie wymkniessssz ssssi� nam!
	Dead      		= "SVM_19_Dead"      	;//Aaaaarhhh!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




