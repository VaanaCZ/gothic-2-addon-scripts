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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_1_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_1_Weather"						;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//�Por fin te tengo!
	DieEnemy					=	"SVM_1_DieEnemy"					;//�Ahora s� que te va a caer una buena!
	DieMonster					=	"SVM_1_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_1_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_1_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_1_SheepKiller"					;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_1_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//�Voy a tener que sacarte de aqu� a palos!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//�Qu� narices hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//�Para de una vez!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//�Una verdadera l�stima, piltrafa!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_1_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_1_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_1_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//�ALARMA!
	Guards						=	"SVM_1_Guards"						;//�GUARDIAS!
	Help						=	"SVM_1_Help"						;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(Anima) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_1_GoodKill"					;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(Llama en voz alta) �Ah� quieto, pat�n!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//�S�, l�rgate de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//�Oro! Muy bien, para empezar me lo quedo...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//El cerdo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Creo que te voy a guardar el arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(A modo de advertencia) �Eh! �Cuidado!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(Con agresividad) �A�n no has tenido bastante?
	StopMagic					=	"SVM_1_StopMagic"					;//�Aparta tu magia de m�!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//�Basta de magia! �Te pasa algo en los o�dos?
	WeaponDown					=	"SVM_1_WeaponDown"					;//�Baja el arma!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//�Est�s sordo o qu�? �Te he dicho que bajes el arma!
	WiseMove					=	"SVM_1_WiseMove"					;//�Ves? Tampoco era tan dif�cil.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(Para s�) Ya veremos...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(Ansioso) �Por fin algo de acci�n!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(Abatido) Se est�n partiendo la cabeza ...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(Con una risa malvada) �Se lo ten�a merecido!
	NotBad						= 	"SVM_1_NotBad"						;//(Con aprobaci�n) No est� nada mal...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(Para s�) Qu� tipo m�s bestia...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//�S�, eso es!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//�A qu� esperas?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//�As� se hace!
	Ooh01						=	"SVM_1_Ooh01"						;//�No le pases ni una!
	Ooh02						=	"SVM_1_Ooh02"						;//�D�jale claro qui�n manda!
	Ooh03						=	"SVM_1_Ooh03"						;//�La leche!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(Para s�, mientras se despierta) �Qu� ha pasado?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//�Sal de la cama!
	Awake						= "SVM_1_Awake"							;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//He o�do que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//He o�do que fuiste a ver al padre Parlan para arrepentirte de tus pecados.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Se rumorea que fuiste a ver a Lee para arreglar ese asunto.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//�Mira que matar nuestras ovejas como si tal cosa! �L�rgate, t�o!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//�No hablo con matones asquerosos!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//�Fuera de aqu�, ladr�n de mierda!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//�Eres una verg�enza para la orden! �Lord Hagen se va a poner furioso!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//�Eres una verg�enza para la guardia de la ciudad! �Lord Andre va a ense�arte modales!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//�Lord Andre se va a enterar de lo que has hecho!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//�El padre Parlan se va a enfadar cuando se entere de este sacrilegio!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//�Lee te va a dar una buena! �Te la vas a ganar!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//�El comandante Garond va a exigirte una explicaci�n!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//�Vale, vale, t� ganas! �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(Con suficiencia) �Tengo que volver a ense�arte qui�n manda?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//�Quieres pelearte otra vez conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 monedas de oro.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 monedas de oro.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 monedas de oro.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 monedas de oro.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 monedas de oro.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 monedas de oro.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 monedas de oro.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 monedas de oro.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 monedas de oro.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 monedas de oro.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 monedas de oro.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 monedas de oro.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 monedas de oro.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 monedas de oro.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 monedas de oro.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 monedas de oro.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 monedas de oro.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 monedas de oro.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 monedas de oro.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 monedas de oro.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 monedas de oro.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 monedas de oro.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 monedas de oro.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 monedas de oro.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 monedas de oro.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 monedas de oro.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 monedas de oro.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//� de veras crees...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//� todo es posible...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//� deb�a haberse andado con ojo...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//� como si no tuvi�ramos bastantes problemas...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//� quien dijo que...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//� s�lo causar� m�s problemas...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//� se ha o�do de todo...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//� yo no lo habr�a hecho...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//� no son m�s que rumores...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//� ser� mejor que tengamos cuidado de con qui�n hablamos...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//� eso podr�a hab�rtelo dicho yo...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//� nadie me pregunta...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//� el pobre da mucha pena...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//� no es ninguna novedad...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//� es evidente...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//� no hace falta que me lo preguntes...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//� ya sabes lo que opino...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//� eso es exactamente lo que dije...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//� nada va a cambiarlo...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//� �por qu� no me he enterado antes?...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//� esperemos a ver qu� pasa...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//� algunos problemas se resuelven solos...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//� no quiero volver a o�rlo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//� se estaba emborrachando...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//� no voy a tolerar que me traten de ese modo...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//� todos huyeron como conejos y me qued� solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//� eso dicen las escrituras...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//� yo siempre act�o en el nombre de Innos...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//� nadie debe violar los mandatos divinos...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//�Ves?, ya has mejorado...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_1_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_1_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_1_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_1_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_1_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad, desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_1_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_1_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_1_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//No es tu ropa. No estoy hablando contigo.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//�Qu� llevas puesto? Ponte algo decente.
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//�Eres un soldado! Viste como tal.
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Tu ropa no es apropiada para nuestra orden. Ve a cambiarte.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Ni siquiera llevas armadura. �L�rgate!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//�Muere, sucio bandido!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//�Escoria pirata!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_3_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_3_Weather"					;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//�Ya te tengo!
	DieEnemy					=	"SVM_3_DieEnemy"					;//�Te voy a hacer pedazos!
	DieMonster					=	"SVM_3_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_3_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_3_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_3_SheepKiller"				;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_3_YouMurderer"				;//�Asesino!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//�No quieres irte? �Muy bien!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//�Qu� hac�as ah� dentro?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//�Te lo ten�as merecido, pat�n!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_3_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_3_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//�No me hagas da�o!
	RunAway						= 	"SVM_3_RunAway"					;//��Oh, mierda!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//�ALARMA!
	Guards						=	"SVM_3_Guards"					;//�GUARDIAS!
	Help						=	"SVM_3_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(Anima) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_3_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(Llama en voz alta) �S�! �Corre todo lo que puedas!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//�S�, l�rgate de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(Se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//�A�n no has tenido bastante?
	StopMagic					=	"SVM_3_StopMagic"				;//�D�jate de magias!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Para ya!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_3_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(Para s�) Ya veremos la pr�xima vez...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(Para s�) Oh, t�o, me duele la cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(Con una risa malvada) �Le has ense�ado qui�n manda!
	NotBad						= 	"SVM_3_NotBad"					;//(Con aprobaci�n) No est� mal...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(Para s�) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//�Sac�dele!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//�Empl�ate a fondo!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//�Dale una lecci�n!
	Ooh01						=	"SVM_3_Ooh01"					;//�Espera!
	Ooh02						=	"SVM_3_Ooh02"					;//�Cuidado!
	Ooh03						=	"SVM_3_Ooh03"					;//�Vaya! �De lleno!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(Para s�, mientras se despierta) �Qu� ha pasado?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_3_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//As� que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//As� que fuiste a ver al padre Parlan para expiar tus pecados.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//As� que fuiste a ver a Lee para arreglar este asunto.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//�Mira que matar nuestras ovejas como si tal cosa!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//�D�jame en paz, animal!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//�D�jame en paz, miserable ladronzuelo!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//�Eres una verg�enza para la orden! �Ya ver�s cuando lord Hagen se entere!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//�Eres una verg�enza para la guardia de la ciudad! �Ya ver�s cuando lord Andre se entere!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Ya ver�s cuando lord Andre se entere.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//�Ya ver�s cuando el padre Parlan se entere!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Ya ver�s cuando Lee se entere de esto...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//�Ya ver�s cuando el comandante Garond se entere de esto!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Vale, vale, eres el mejor. �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) Supongo que, a estas alturas, eres consciente de qui�n es el m�s fuerte... �Qu� quieres?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Cre�a que quer�as pelearte conmigo. �Has cambiado de opini�n? �Prefieres HABLAR? (se r�e)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 monedas de oro.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//� de veras crees...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//� todo es posible...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//� deb�a haberse andado con ojo...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//� como si no tuviera bastantes problemas...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//� �qui�n te lo cont�?...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//� s�lo causar� m�s problemas...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//� se ha o�do de todo...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//� nunca hubiera pensado...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//� no son m�s que rumores...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//� ten cuidado de a qui�n le cuentas las cosas...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//� eso podr�a hab�rtelo dicho yo...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//� nadie me pregunta...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//� el pobre da mucha pena...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//� no es ninguna novedad...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//� es evidente...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//� no hace falta que me lo preguntes...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//� ya sabes lo que opino...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//� ya lo dije yo...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//� nada va a cambiarlo...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//� �por qu� no me he enterado antes?...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//� esperemos a ver qu� pasa...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//� algunos problemas se resuelven solos...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//� no quiero volver a o�rlo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//� se estaba emborrachando...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//� no voy a tolerar que me traten de ese modo...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//� todos huyeron como conejos y me qued� solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//� eso dicen las escrituras...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//� yo siempre act�o en el nombre de Innos...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//� nadie debe violar los mandatos divinos...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_3_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_3_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_3_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_3_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_3_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_3_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_3_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_3_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//�Qu� clase de ropa es esa? No te sienta bien. D�jame solo.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Si quieres hablar conmigo, ponte antes algo decente.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//Los soldados llevamos con orgullo nuestro uniforme. C�mbiate.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//En nuestra orden, todos somos iguales, as� que todos llevamos lo mismo. �Ve a cambiarte!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Parece que acabas de salir de la c�rcel. Ve a buscarte algo de ropa decente.

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//�VEN AQU�, BANDIDO!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//�VEN AQU�, PIRATA!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_4_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_4_Weather"						;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//�Otra vez T�!
	DieEnemy					=	"SVM_4_DieEnemy"					;//�Te voy a hacer pedazos!
	DieMonster					=	"SVM_4_DieMonster"					;//�Otra de esas criaturas!
	DirtyThief					=	"SVM_4_DirtyThief"					;//�Miserable ladronzuelo!
	HandsOff					=	"SVM_4_HandsOff"					;//�Aparta tus sucias manos!
	SheepKiller					=	"SVM_4_SheepKiller"					;//�Eh! �Deja en paz a nuestras ovejas!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//�Ese monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_4_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//�Qu� hace aqu� esa criatura?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//�Ahora s� que te va a caer una buena!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Hay gente que s�lo aprende por las malas.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//�Qu� hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//�Para de una vez!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//�Muere!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Qu� tipo m�s est�pido...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//�Una verdadera l�stima, bestia asquerosa!
	ThiefDown					=	"SVM_4_ThiefDown"					;//A partir de ahora, aparta las zarpas de mis cosas. �Te enteras?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//�A partir de ahora, mant�n quietecitos esos dedos!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//�Ni se te ocurra volver a poner tus mugrientas zarpas en nuestras ovejas!
	KillMurderer				=	"SVM_4_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//�No vuelvas a intentar eso!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Que te sirva de escarmiento.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//�Lev�ntate y l�rgate de aqu�!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//No quiero volver a verte ah� dentro. �Te enteras?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Aqu� solo me peleo yo, �te enteras?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_4_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//�ALARMA!
	Guards						=	"SVM_4_Guards"					;//�GUARDIAS!
	Help						=	"SVM_4_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(Anima) �Eso es! �As� se mata a un bicho de esos!
	GoodKill					= 	"SVM_4_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(Grita) �Volveremos a vernos!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//�Largo!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//��Qu� pintas aqu�?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//�L�rgate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//�Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(Se despierta) �Qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(Agresivo) �Quieres que te vuelva a partir la cara?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//�D�jate de rollos m�gicos!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Para ya!!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_4_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(Para s�) Ya veremos la pr�xima vez ...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(Con una risa malvada) �Le has ense�ado qui�n manda!
	NotBad						= 	"SVM_4_NotBad"					;//(Con aprobaci�n) No est� mal ...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(Para s�) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//�S�, dale una buena tunda!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//�Dale una lecci�n!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//�Acaba con �l!
	Ooh01						=	"SVM_4_Ooh01"					;//�Defi�ndete!
	Ooh02						=	"SVM_4_Ooh02"					;//�Venga, responde!
	Ooh03						=	"SVM_4_Ooh03"					;//�Ay! �Menudo golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(Para s�, mientras se despierta) Maldita sea, �qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//�Sal de la cama!
	Awake						= "SVM_4_Awake"						;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//As� que el comandante lo ha arreglado.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//As� que has hecho penitencia con el padre Parlan.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//He o�do que Lee ha conseguido solucionar el asunto.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Bien.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//�Te has pasado al matar ovejas! �Largo!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Eres un mat�n. �Largo de aqu�!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//�Maldito ladr�n! �Me tienes harto!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//�Habr�a esperado algo m�s de un palad�n! A lord Hagen no le va a hacer ninguna gracia.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//�C�mo ha conseguido ingresar en la guardia de la ciudad alguien como t�? �Lord Andre te lo va a hacer pagar caro!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//�Lord Andre va a enterarse de lo que has hecho!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//�El padre Parlan se va a poner furioso por tu sacrilegio!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//�Lee no va a permitir que te salgas con la tuya!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Cuando se entere, el comandante Garond se va a cabrear. �Vas a pagarlo caro!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Pegas bastante fuerte... �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) �Alguna pregunta m�s?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//�Ya est�s otra vez!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 monedas de oro.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...es absolutamente cierto...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//� no es eso lo que he o�do...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//� no me digas que no lo sab�as...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//� en estos tiempos no se sabe qui�n es digno de cr�dito...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//� no son m�s que chismorreos...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//� yo tampoco ando mejor...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//� ya nada me sorprende...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//� en realidad no es mi problema...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//� de verdad te crees eso...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//� no le contar� nada a nadie...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//� eso siempre ha sido evidente...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//� hizo caso a la gente equivocada...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//� si no es capaz de verlo, no puedo ayudarle...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//� no te cuento nada nuevo...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//� a �l no se le habr�a ocurrido...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//� se sabe desde hace mucho...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//� es un mal asunto...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//� yo no lo habr�a hecho as�...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//� coincido contigo al cien por cien...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//� �cambiar� alg�n d�a?...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//� no lo sab�a...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//� no se puede hacer nada al respecto...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//� no me sorprende...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//� pero no, insisti� en que sab�a lo que hac�a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//� la fuerza es lo �nico que importa, as� que no me vengas con esas...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//� ni siquiera sabe blandir una espada...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//� s�, eso fue lo que dijo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//� alguien tiene que pagar por ello...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//� Innos ilumina a todos aquellos que reconocen su sabidur�a...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//� al final, se impondr� la justicia...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Ya no te puedo ense�ar nada m�s. Eres demasiado bueno.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_4_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_4_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_4_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_4_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_4_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_4_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_4_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_4_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Primero v�stete decentemente y luego seguimos hablando.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//M�s vale que te pongas tu armadura si quieres hablar conmigo.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//�Nadie te ha dado una armadura de las nuestras? Pues consigue una.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//�D�nde est� tu t�nica? Ve a cambiarte. Si no, no hablar� contigo.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//�Qu� clase de mendigo est�s hecho? Vuelve cuando puedas permitirte una armadura.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//�Otro bandido!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//�Sucio pirata!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_5_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_5_Weather"						;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//�Por fin te tengo!
	DieEnemy					=	"SVM_5_DieEnemy"					;//�Ahora s� que te va a caer una buena!
	DieMonster					=	"SVM_5_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_5_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_5_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_5_SheepKiller"					;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_5_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//�Voy a tener que sacarte de aqu� a palos!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//�Qu� narices hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//�Una verdadera l�stima, piltrafa!
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_5_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_5_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_5_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//�ALARMA!
	Guards						=	"SVM_5_Guards"						;//�GUARDIAS!
	Help						=	"SVM_5_Help"						;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(Anima) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_5_GoodKill"					;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(Llama en voz alta) �Ah� quieto, pat�n!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//�S�, l�rgate de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(Se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//�Oro! Muy bien, para empezar me lo quedo...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//�Ni siquiera tienes oro?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Creo que te voy a guardar el arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(A modo de advertencia) �Eh! �Cuidado!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(Con agresividad) �A�n no has tenido bastante?
	StopMagic					=	"SVM_5_StopMagic"					;//�Aparta tu magia de m�!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//�Basta de magia! �Te pasa algo en los o�dos?
	WeaponDown					=	"SVM_5_WeaponDown"					;//�Baja el arma!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//�Est�s sordo o qu�? �Te he dicho que bajes el arma!
	WiseMove					=	"SVM_5_WiseMove"					;//�Ves? Tampoco era tan dif�cil.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(Para s�) Ya veremos...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(Ansioso) �Por fin algo de acci�n!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(Abatido) Pero se est�n partiendo la cabeza ...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(Con una risa malvada) �Se lo ten�a merecido!
	NotBad						= 	"SVM_5_NotBad"						;//(Con aprobaci�n) No est� nada mal...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(Para s�) Qu� tipo m�s bestia...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//�S�, eso es!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//�A qu� esperas?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//�As� se hace!
	Ooh01						=	"SVM_5_Ooh01"						;//�No le pases ni una!
	Ooh02						=	"SVM_5_Ooh02"						;//�D�jale claro qui�n manda!
	Ooh03						=	"SVM_5_Ooh03"						;//�La leche!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(Para s�, mientras se despierta) �Qu� ha pasado?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//�Sal de la cama!
	Awake						= "SVM_5_Awake"							;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//He o�do que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//He o�do que fuiste a ver al padre Parlan para hacer penitencia.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//He o�do que fuiste a ver a Lee para solucionar el asunto.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//�Mira que matar nuestras ovejas como si tal cosa! �L�rgate, t�o!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//�No hablo con matones asquerosos!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//�Fuera de aqu�, ladr�n de mierda!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//�Eres una verg�enza para la orden! �Lord Hagen se va a poner furioso!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//�Eres una verg�enza para la guardia de la ciudad! �Lord Andre va a ense�arte modales!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//�Lord Andre se va a enterar de lo que has hecho!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//�El padre Parlan se va a enfadar cuando se entere de este sacrilegio!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//�Lee te va a dar una buena! �Te la vas a ganar!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//�El comandante Garond va a exigirte una explicaci�n!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//�Vale, vale, t� ganas! �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(Con suficiencia) �Tengo que volver a ense�arte qui�n manda?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//�Quieres pelearte otra vez conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 monedas de oro.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 monedas de oro.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 monedas de oro.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 monedas de oro.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 monedas de oro.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 monedas de oro.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 monedas de oro.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 monedas de oro.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 monedas de oro.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 monedas de oro.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 monedas de oro.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 monedas de oro.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 monedas de oro.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 monedas de oro.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 monedas de oro.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 monedas de oro.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 monedas de oro.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 monedas de oro.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 monedas de oro.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 monedas de oro.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 monedas de oro.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 monedas de oro.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 monedas de oro.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 monedas de oro.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 monedas de oro.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 monedas de oro.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 monedas de oro.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//� de veras crees...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//� todo es posible...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//� deb�a haberse andado con ojo...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//� como si no tuviera bastantes problemas...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//� �qui�n te lo cont�?...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//� s�lo causar� m�s problemas...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//� se ha o�do de todo...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//� yo no lo habr�a hecho...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//� no son m�s que rumores...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//� ser� mejor que tengamos cuidado de con qui�n hablamos...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//� eso podr�a hab�rtelo dicho yo...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//� nadie me pregunta...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//� el pobre da mucha pena...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//� no es ninguna novedad...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//� es evidente...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//� no hace falta que me lo preguntes...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//� ya sabes lo que opino...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//� eso es exactamente lo que dije...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//� nada va a cambiarlo...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//� �por qu� no me he enterado antes?...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//� esperemos a ver qu� pasa...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//� algunos problemas se resuelven solos...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//� no quiero volver a o�rlo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//� se estaba emborrachando...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//� no voy a tolerar que me traten de ese modo...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//� todos huyeron como conejos y me qued� solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//� eso dicen las escrituras...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//� yo siempre act�o en el nombre de Innos...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//� nadie debe violar los mandatos divinos...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_5_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_5_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_5_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_5_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_5_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_5_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_5_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_5_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Primero ponte algo apropiado.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//�Qu� llevas puesto? �Ya no eres de los nuestros? En ese caso, no tendr�a nada que ver contigo.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//Los soldados luchamos por el Rey, as� que ponte esta armadura.
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//�Para qu� quieres ropa de la orden si no te la pones? Pi�nsalo.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//�Qu� clase de miserable est�s hecho? Ni siquiera tienes armadura. Largo.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Ah, un bandido.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//�Te har� trizas, pirata!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_6_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_6_Weather"					;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//�Ya te tengo!
	DieEnemy					=	"SVM_6_DieEnemy"					;//�No debiste entrar aqu�!
	DieMonster					=	"SVM_6_DieMonster"					;//�Ven aqu�, maldita bestia!
	DirtyThief					=	"SVM_6_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_6_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_6_SheepKiller"				;//�Deja en paz nuestras ovejas!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//�Ap�rtate de las ovejas, animal!
	YouMurderer					=	"SVM_6_YouMurderer"				;//�Asesino!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//�Te vas a arrepentir de esto!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Luego no digas que no te lo advert�.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//�Eh, LARGO!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//�Eh! �Qu� hac�as ah� dentro?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//�Basta ya!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//�Te voy a ensartar, canalla!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Es una pena ...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//�Eh, he acabado con �l!
	ThiefDown					=	"SVM_6_ThiefDown"					;//�Te lo advierto! �No vuelvas a intentarlo, ladr�n asqueroso!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//�A partir de ahora, no te acerques a nuestras ovejas!
	KillMurderer				=	"SVM_6_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//�Ni se te ocurra volver a atacarme!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Luego no digas que no te lo advert�.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//�Y ahora l�rgate!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//No quiero volver a verte ah� dentro, �capisce?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Aqu� no se pelea. Que te sirva de lecci�n.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//�No intentes nada raro!
	RunAway						= 	"SVM_6_RunAway"						;//�Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//�ALARMA!
	Guards						=	"SVM_6_Guards"					;//�GUARDIAS!
	Help						=	"SVM_6_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(Anima) �Env�a a esas bestias al infierno!
	GoodKill					= 	"SVM_6_GoodKill"				;//(Alienta) �Eso es, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(Llama en voz alta) �Ya nos veremos las caras!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//�Aqu� no pintas nada!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//�S�, largo!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//�Qu� tramas? �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(Se despierta) Maldita sea, �qu� quieres?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Bueno, al menos tienes algo de oro.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Ni siquiera tienes oro. �Bah!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Creo que voy a quedarme con tu arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(A modo de advertencia) �Oye! �No se te ocurra volver a hacerlo!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(Con agresividad) �Quieres que te d� otra paliza?
	StopMagic					=	"SVM_6_StopMagic"				;//�Basta de magia!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//�Es la �ltima vez que te aviso! �Basta de magia!
	WeaponDown					=	"SVM_6_WeaponDown"				;//�Deja esa arma!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//�Como no lo apartes, te la cargas!
	WiseMove					=	"SVM_6_WiseMove"				;//�Vaya, no eres tan tonto como pareces!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(para s�) No vuelvas a intentarlo ...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(para s�) �Oh! Mi cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(�vido) Y ahora viene lo divertido...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(Abatido) Oh, cielos...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(Con una risa malvada) Que le sirva de escarmiento...
	NotBad						= 	"SVM_6_NotBad"					;//(Con aprobaci�n) �De lleno!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(Cara s�) �Menudo animal!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//�Sac�dele!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//�Ahora no te pares!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//�Acaba con �l!
	Ooh01						=	"SVM_6_Ooh01"					;//�Cuidado!
	Ooh02						=	"SVM_6_Ooh02"					;//�Para el golpe!
	Ooh03						=	"SVM_6_Ooh03"					;//�Mierda, vaya golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(Para s�, mientras se despierta) �Qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_6_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//As� que el comandante ha hecho las paces contigo.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//El padre Parlan te ha absuelto de tu culpa.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//As� que fuiste a ver a Lee y solucionaste ese tema.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Bien.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//�Atacas a las ovejas? No has podido encontrar a otra v�ctima m�s indefensa, �eh?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//�No me trato con matones!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//�No quiero tener nada que ver con ladrones!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//�Y quieres ser palad�n? �A ver qu� opina de esto lord Hagen!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//�De verdad perteneces a la guardia de la ciudad? �Lord Andre no va a tolerar esto!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Ve a ver a lord Andre mientras puedas.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Ve a ver al padre Parlan. Te ayudar� a expiar los pecados.
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee va a acabar enter�ndose de esto, y vas a pagarlo caro.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Al comandante Garond no le va a gustar nada. Ser� mejor que hables con �l antes de que empeoren las cosas.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Muy bien, t� ganas. �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) Creo que ya sabes con qui�n te la est�s jugando. �Qu� quieres?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//�Otra vez t�? �Quieres volver a pelearte conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 monedas de oro.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//... no me lo puedo creer ...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//� no estar�a tan seguro...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//� pero lo supo desde el primer momento...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//� ya no s� en qu� creer...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//� no s� por qu� se enfada tanto...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//� ya tengo bastantes problemas...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//� he escuchado un par de cosas...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//� no voy a entrar en eso...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//� no deber�as creerte todo lo que oyes...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//� no fui yo el que se lo cont�...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//� ya me lo imaginaba...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//� nadie quiere saber lo que opino...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//� la verdad es que no se lo merec�a...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//� no me digas que no lo sab�as...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//� resultaba evidente...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//� entonces, �d�nde te has enterado?...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//� me he formado mi propia opini�n al respecto...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//� ten�as raz�n...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//� no creo que esto vaya a cambiar...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//� �no sab�a nada! ...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//� a ver qu� pasa...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//� sab�a que ser�a un problema...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//� �por qu� no me hacen caso?...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//� corri� como si le persiguiese el mism�simo Beliar...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//� claro que, al final, le cogimos...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//� tienes que intervenir y solucionar el asunto...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//� algunos no saben lo malvados que son...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//� as� lo quiere Innos...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//� sus obras fueron justas...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_6_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_6_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_6_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_6_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_6_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_6_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_6_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_6_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//Est�s rid�culo con ese atuendo. Ponte algo decente.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//No te creas que no te reconozco. Vete y c�mbiate.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Soldado. �Qu� clase de ropa es esa? �C�mbiate ipso facto!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Un siervo de Innos no se esconde. Ve a por tu uniforme.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//As� pareces un cavador. Ve a ponerte algo.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//�Has aceptado un duelo con el tipo equivocado, BANDIDO!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//�Vuelve al mar, PIRATA!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_7_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_7_Weather"						;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//�Otra vez T�!
	DieEnemy					=	"SVM_7_DieEnemy"					;//�Te voy a hacer pedazos!
	DieMonster					=	"SVM_7_DieMonster"					;//�Otra de esas criaturas!
	DirtyThief					=	"SVM_7_DirtyThief"					;//�Miserable ladronzuelo!
	HandsOff					=	"SVM_7_HandsOff"					;//�Aparta tus sucias manos!
	SheepKiller					=	"SVM_7_SheepKiller"					;//�Eh! �Deja en paz a nuestras ovejas!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//�Ese monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_7_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//�Qu� hace aqu� esa criatura?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//�Ahora s� que te va a caer una buena!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Hay gente que s�lo aprende por las malas.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//�Qu� hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//�Para de una vez!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//�Muere!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Qu� tipo m�s est�pido...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//�Una verdadera l�stima, bestia asquerosa!
	ThiefDown					=	"SVM_7_ThiefDown"					;//A partir de ahora, aparta las zarpas de mis cosas. �Te enteras?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//�A partir de ahora, mant�n quietecitos esos dedos!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//�Ni se te ocurra volver a poner tus mugrientas zarpas en nuestras ovejas!
	KillMurderer				=	"SVM_7_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//�No vuelvas a intentar eso, t�o!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Que te sirva de escarmiento.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//�Lev�ntate y l�rgate de aqu�!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//No quiero volver a verte ah� dentro. �Te enteras?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//Aqu� solo me peleo yo, �te enteras?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_7_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//�ALARMA!
	Guards						=	"SVM_7_Guards"					;//�GUARDIAS!
	Help						=	"SVM_7_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(Anima) �Eso es! �As� se mata a un bicho de esos!
	GoodKill					= 	"SVM_7_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(Grita) �Volveremos a vernos!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//�Largo!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//��Qu� pintas aqu�?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//�L�rgate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//�Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(Se despierta) �Qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(Agresivo) �Quieres que te vuelva a partir la cara?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//�D�jate de rollos m�gicos!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Para ya!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_7_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(Para s�) Ya veremos la pr�xima vez ...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(Con una risa malvada) �Le has ense�ado qui�n manda!
	NotBad						= 	"SVM_7_NotBad"					;//(Con aprobaci�n) No est� mal ...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(Para s�) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//�S�, dale una buena tunda!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//�Dale una lecci�n!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//�Sac�dele en condiciones!
	Ooh01						=	"SVM_7_Ooh01"					;//�Defi�ndete!
	Ooh02						=	"SVM_7_Ooh02"					;//�Venga, responde!
	Ooh03						=	"SVM_7_Ooh03"					;//�Ay! �Menudo golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(Para s�, mientras se despierta) Maldita sea, �qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//�Sal de la cama!
	Awake						= "SVM_7_Awake"						;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//As� que el comandante lo ha arreglado.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//As� que has hecho penitencia con el padre Parlan.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//He o�do que Lee ha conseguido solucionar el asunto.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Bien.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//�Te has pasado al matar ovejas! �Largo!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Eres un mat�n. �Largo de aqu�!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//�Maldito ladr�n! �Me tienes harto!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//�Habr�a esperado algo m�s de un palad�n! A lord Hagen no le va a hacer ninguna gracia.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//�C�mo ha conseguido ingresar en la guardia de la ciudad alguien como t�? �Lord Andre te lo va a hacer pagar caro!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//�Lord Andre va a enterarse de lo que has hecho!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//�El padre Parlan se va a poner furioso por tu sacrilegio!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//�Lee no va a permitir que te salgas con la tuya!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Cuando se entere, el comandante Garond se va a cabrear. �Vas a pagarlo caro!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Pegas bastante fuerte... �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) �Alguna pregunta m�s?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//�Ya est�s otra vez!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 monedas de oro.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//� es cierto...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//� no es eso lo que he o�do...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//� no me digas que no lo sab�as...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//� en estos tiempos no se sabe qui�n es digno de cr�dito...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//� no son m�s que chismorreos...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//� yo tampoco ando mejor...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//� ya nada me sorprende...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//� en realidad no es mi problema...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//� de verdad te crees eso...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//� no le contar� nada a nadie...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//� eso siempre ha sido evidente...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//� hizo caso a la gente equivocada...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//� si no es capaz de verlo, no puedo ayudarle...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//� no te cuento nada nuevo...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//� a �l no se le habr�a ocurrido...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//� se sabe desde hace mucho...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//� es un mal asunto...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//� yo no habr�a hecho eso...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//� coincido contigo al cien por cien...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//� �cambiar� alg�n d�a?...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//� no lo sab�a...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//� no se puede hacer nada al respecto...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//� no me sorprende...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//� pero no, insisti� en que sab�a lo que hac�a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//� la fuerza es lo �nico que importa, as� que no me vengas con esas...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//� ni siquiera sabe blandir una espada...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//� s�, eso fue lo que dijo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//� alguien tendr� que pagarlo caro...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//� Innos ilumina a todos aquellos que reconocen su sabidur�a...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//� al final, se impondr� la justicia...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Ya no te puedo ense�ar nada m�s. Eres demasiado bueno.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_7_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_7_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_7_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_7_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_7_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_7_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_7_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_7_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//�Por qu� el disfraz? No pienso hablarte con esa pinta.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//�Qu� llevas puesto? �Ponte la armadura, haz el favor!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//Esto es una violaci�n del c�digo de vestimenta del ej�rcito. A cambiarte, en el acto.
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Mejor ser� que te pongas la t�nica. Si no, no te dirigir� la palabra y rezar� por ti.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//�Qu� quieres? No eres de los nuestros. Ni siquiera llevas nuestra armadura.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//�Muere, bandido miserable!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//�Muere, pirata despreciable!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_8_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_8_Weather"					;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//�Ya te tengo!
	DieEnemy					=	"SVM_8_DieEnemy"					;//�Te voy a hacer pedazos!
	DieMonster					=	"SVM_8_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_8_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_8_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_8_SheepKiller"				;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_8_YouMurderer"				;//�Asesino!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//�No quieres irte? �Muy bien!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//�Qu� hac�as ah� dentro?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//�Te lo ten�as merecido, pat�n!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_8_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_8_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//�No me hagas da�o!
	RunAway						= 	"SVM_8_RunAway"					;//��Oh, mierda!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//�ALARMA!
	Guards						=	"SVM_8_Guards"					;//�GUARDIAS!
	Help						=	"SVM_8_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(Anima) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_8_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(Llama en voz alta) �Eso es! �Corre todo lo que puedas!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//�S�, l�rgate de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//�A�n no has tenido bastante?
	StopMagic					=	"SVM_8_StopMagic"				;//�D�jate de magias!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Para ya!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_8_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(Para s�) Ya veremos la pr�xima vez ...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(Con una risa malvada) �Le has dado un buen escarmiento!
	NotBad						= 	"SVM_8_NotBad"					;//(Con aprobaci�n) No est� mal ...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(Para s�) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//�Sac�dele!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//�Empl�ate a fondo!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//�Dale una lecci�n!
	Ooh01						=	"SVM_8_Ooh01"					;//�Espera!
	Ooh02						=	"SVM_8_Ooh02"					;//�Cuidado!
	Ooh03						=	"SVM_8_Ooh03"					;//�Ay! �De lleno!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(Para s�, mientras se despierta) �Qu� ha pasado?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_8_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//As� que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//As� que fuiste a ver al padre Parlan para expiar tus pecados.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//As� que fuiste a ver a Lee para arreglar este asunto.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//�Mira que matar nuestras ovejas como si tal cosa!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//�D�jame en paz, animal!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//�D�jame en paz, miserable ladronzuelo!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//�Eres una verg�enza para la orden! �Ya ver�s cuando lord Hagen se entere!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//�Eres una verg�enza para la guardia de la ciudad! �Ya ver�s cuando lord Andre se entere!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Ya ver�s cuando lord Andre se entere.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//�Ya ver�s cuando el padre Parlan se entere!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Ya ver�s cuando Lee se entere de esto...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//�Ya ver�s cuando el comandante Garond se entere de esto!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Vale, vale, eres el mejor. �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) Supongo que, a estas alturas, eres consciente de qui�n es el m�s fuerte... �Qu� quieres?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Cre�a que quer�as pelearte conmigo. �Has cambiado de opini�n? �Prefieres HABLAR? (se r�e)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 monedas de oro.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//� es absolutamente cierto...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//� no es eso lo que he o�do...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//� no me digas que no lo sab�as...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//� en estos tiempos no se sabe qui�n es digno de cr�dito...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//� no son m�s que chismorreos...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//� yo tampoco ando mejor...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//� nada me sorprende...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//� en realidad no es mi problema...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//� de verdad te crees eso...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//� no le contar� nada a nadie...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//� eso siempre ha sido evidente...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//� hizo caso a la gente equivocada...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//� si no es capaz de verlo, no puedo ayudarle...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//� no te cuento nada nuevo...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//� a �l no se le habr�a ocurrido...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//� se sabe desde hace mucho...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//� es un mal asunto...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//� yo no habr�a hecho eso...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//� coincido contigo al cien por cien...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//� �cambiar� alg�n d�a?...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//� no lo sab�a...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//� no se puede hacer nada al respecto...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//� no me sorprende...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//� pero no, insisti� en que sab�a lo que hac�a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//� la fuerza es lo �nico que importa, as� que no me vengas con esas...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//� ni siquiera sabe blandir una espada...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//� s�, eso fue lo que dijo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//� alguien tendr� que pagarlo caro...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//� Innos ilumina a todos aquellos que reconocen su sabidur�a...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//� al final, se impondr� la justicia...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Ya no te puedo ense�ar nada m�s. Eres demasiado bueno.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_8_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_8_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_8_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_8_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_8_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_8_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_8_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_8_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//No me fi� de ti. Hay algo que no me gusta de tu forma de vestir.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//A juzgar por tu aspecto, debes pertenecer a otra hermandad, con lo cual, no tengo nada que ver contigo.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Tenemos que estar presentables. Ver a por tu armadura.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos quiere que llevemos sus t�nicas con orgullo. Ve a cambiarte.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//No hablo con cavadores. Ni siquiera llevas armadura.

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//�Sucio bandido!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//�PIRATAS!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_9_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_9_Weather"						;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//�Ya te tengo!
	DieEnemy					=	"SVM_9_DieEnemy"					;//�No debiste venir!
	DieMonster					=	"SVM_9_DieMonster"					;//�Ven aqu�, bestia asquerosa!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//�Otra de esas bestias!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//�Otra de esas bestias inmundas!
	DirtyThief					=	"SVM_9_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_9_HandsOff"					;//�Quita las zarpas!
	SheepKiller					=	"SVM_9_SheepKiller"				;//�Deja en paz nuestras ovejas!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//�Ap�rtate de las ovejas, animal repugnante!
	YouMurderer					=	"SVM_9_YouMurderer"				;//�Asesino!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//�Te vas a arrepentir de esto!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//�Te lo advert�!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//�Te he dicho que te largues!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//�Eh! �Qu� hac�as ah� dentro?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//�Estate quieto de una vez!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//�Te voy a ensartar, cerdo!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//Se te acab� la suerte...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Schei�e!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//�Se acab�, bestia repugnante!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//�UN monstruo menos!
	ThiefDown					=	"SVM_9_ThiefDown"					;//�Te lo advierto! �No vuelvas a intentarlo, maldito ladr�n!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//�A partir de ahora, no te acerques a nuestras ovejas!
	KillMurderer				=	"SVM_9_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//�Maldita criatura est�pida!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//�Ni se te ocurra volver a atacarme!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//�Te lo advert�!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//Y ahora, �largo!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//No quiero volver a verte ah� dentro, �te enteras?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Aqu� no se pelea. �Que no se te olvide!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//�No cometas ninguna estupidez!
	RunAway						= 	"SVM_9_RunAway"						;//�Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//�ALARMA!
	Guards						=	"SVM_9_Guards"					;//�GUARDIAS!
	Help						=	"SVM_9_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(Anima) �Env�a a esas bestias al infierno!
	GoodKill					= 	"SVM_9_GoodKill"				;//(Grita) �Eso es, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(Grita desaforadamente) �Ya me ocupar� de ti!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//�Aqu� no pintas nada!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//�Largo de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//�Qu� tramas? �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(Se despierta) Maldita sea, �qu� quieres?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Bueno, al menos tienes algo de oro.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Ni siquiera tienes oro. �Bah!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Creo que voy a quedarme con tu arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(A modo de advertencia) �Oye! �No se te ocurra volver a hacerlo!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(Con agresividad) �Quieres otra paliza?
	StopMagic					=	"SVM_9_StopMagic"				;//�Basta de magia!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//�Es la �ltima vez que te aviso! �Basta de magia!
	WeaponDown					=	"SVM_9_WeaponDown"				;//�Baja el arma!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//�Como no lo apartes, te la cargas!
	WiseMove					=	"SVM_9_WiseMove"				;//�Vaya, no eres tan tonto como pareces!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(Para s�) No vuelvas a intentarlo...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(Para s�) �Oh! Mi cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(�vido) Y ahora viene lo divertido...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(Abatido) Oh, cielos...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(Con una risa malvada) Que le sirva de escarmiento...
	NotBad						= 	"SVM_9_NotBad"					;//(Con aprobaci�n) �De lleno!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(Para s�) �Menudo animal!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//�Sac�dele!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//�Ahora no te pares!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//�Acaba con �l!
	Ooh01						=	"SVM_9_Ooh01"					;//�Cuidado!
	Ooh02						=	"SVM_9_Ooh02"					;//�Para el golpe!
	Ooh03						=	"SVM_9_Ooh03"					;//�Mierda, vaya golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(Para s�, mientras se despierta) �Qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_9_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//As� que el comandante ha hecho las paces contigo.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//El padre Parlan te ha librado de tu culpa.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//As� que fuiste a ver Lee y solucionaste aquel asunto.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Bien.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//�Atacas a las ovejas? No has podido encontrar a otra v�ctima m�s indefensa, �eh?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//�No me trato con matones!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//�No quiero tener nada que ver con los ladrones!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//�Y quieres ser palad�n? �Ya ver�s lo que dice lord Hagen cuando se entere de esto!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//�De verdad perteneces a la guardia de la ciudad? �Lord Andre no va a tolerar esto!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Ve a ver a lord Andre mientras puedas.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Ve a ver al padre Parlan. Te ayudar� a expiar los pecados.
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee va a acabar enter�ndose, y vas a pagarlo caro.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Al comandante Garond no le va a gustar nada. Ser� mejor que hables con �l antes de que empeoren las cosas.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Muy bien, t� ganas. �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) Creo que ya sabes con qui�n te la est�s jugando. �Qu� quieres?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//�Otra vez t�? �Quieres volver a pelearte conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 monedas de oro.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//� no me lo puedo creer...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//� no estar�a tan seguro...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//� pero lo supo desde el primer momento...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//� ya no s� en qu� creer...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//� no s� por qu� se enfada tanto...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//� ya tengo bastantes problemas...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//� he escuchado un par de cosas...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//� no voy a entrar en eso...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//� no deber�as creerte todo lo que oyes...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//� no fui yo el que se lo cont�...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//� ya me lo imaginaba...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//� nadie quiere saber lo que opino...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//� la verdad es que no se lo merec�a...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//� no me digas que no lo sab�as...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//� eso era evidente...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//� entonces, �d�nde te has enterado?...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//� tengo mi propia opini�n al respecto.
	Smalltalk19					= "SVM_9_Smalltalk19"				;//� ten�as raz�n...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//� no creo que esto vaya a cambiar...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//� �no sab�a nada!...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//� habr� que esperar a ver qu� pasa...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//� sab�a que ser�a un problema...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//� �por qu� no me hacen caso?...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//� corri� como si le persiguiese el mism�simo Beliar...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//� claro que, al final, le cogimos...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//� tienes que intervenir y solucionar el asunto...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//� algunos no saben lo malvados que son...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//� as� lo quiere Innos...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//� sus obras fueron justas...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_9_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_9_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_9_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_9_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_9_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_9_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_9_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_9_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//�Qu� es esa vestimenta? Ponte algo que te siente bien.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//�Qu� es eso que llevas? �Ponte la armadura, haz el favor!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Trabajas para el rey, as� que debes llevar su armadura. C�mbiate.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//No llevas ropa apropiada para nuestra orden. Ve a cambiarte.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Ni siquiera llevas armadura. �Largo!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//�Ahora es tu turno, bandido!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//No deber�as haber venido, pirata.
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_10_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_10_Weather"						;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//�Otra vez T�!
	DieEnemy					=	"SVM_10_DieEnemy"					;//�Te voy a hacer pedazos!
	DieMonster					=	"SVM_10_DieMonster"					;//�Otra de esas criaturas!
	DirtyThief					=	"SVM_10_DirtyThief"					;//�Miserable ladronzuelo!
	HandsOff					=	"SVM_10_HandsOff"					;//�Aparta las manos de eso!
	SheepKiller					=	"SVM_10_SheepKiller"					;//�Eh! �Deja en paz a nuestras ovejas!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//�Ese monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_10_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//�Qu� hace aqu� esa criatura?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//�Ahora s� que te va a caer una buena!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Hay gente que s�lo aprende por las malas.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//�Qu� hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//�Para de una vez!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//�Muere!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Qu� tipo m�s est�pido...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//�Una verdadera l�stima, bestia asquerosa!
	ThiefDown					=	"SVM_10_ThiefDown"					;//En el futuro, aparta las zarpas de mis cosas. �Te enteras?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//�A partir de ahora, mant�n quietecitos esos dedos!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//�Ni se te ocurra volver a poner tus mugrientas zarpas en nuestras ovejas!
	KillMurderer				=	"SVM_10_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//�Maldita criatura est�pida!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//�Ni se te ocurra volver a intentarlo, t�o!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Que te sirva de escarmiento.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//�Lev�ntate y l�rgate de aqu�!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//No quiero volver a verte ah� dentro. �Te enteras?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Aqu� solo me peleo yo, �te enteras?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_10_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//�ALARMA!
	Guards						=	"SVM_10_Guards"					;//�GUARDIAS!
	Help						=	"SVM_10_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(Anima) �Eso es! �As� se mata a un bicho de esos!
	GoodKill					= 	"SVM_10_GoodKill"				;//(Alienta) �Ese cerdo se lo tiene merecido!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(Grita) �Volveremos a vernos!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//�Largo!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//��Qu� pintas aqu�?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//�S�, l�rgate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//�Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(Se despierta) �Qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Pobre diablo... �ni siquiera tienes oro!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Creo que te voy a guardar el arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(Con agresividad) �Quieres que te vuelva a partir la cara?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//�D�jate de rollos m�gicos!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Estate quieto ya!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//�Aparta el arma!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//�Aparta de una vez la maldita arma!
	WiseMove					=	"SVM_10_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(Para s�) Ya veremos la pr�xima vez...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(Para s�) Oh t�o, me duele la cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(Con una risa malvada) �Le has dado una buena lecci�n!
	NotBad						= 	"SVM_10_NotBad"					;//(Elogioso) No est� mal...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(Para s�) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//�S�, dale una buena tunda!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//�Dale una lecci�n!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//�Acaba con �l!
	Ooh01						=	"SVM_10_Ooh01"					;//�Defi�ndete!
	Ooh02						=	"SVM_10_Ooh02"					;//�Venga, responde!
	Ooh03						=	"SVM_10_Ooh03"					;//�Ay! �Menudo golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(Para s�, mientras se despierta) Maldita sea, �qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//�Sal de la cama!
	Awake						= "SVM_10_Awake"						;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//As� que el comandante lo ha arreglado.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//As� que has hecho penitencia con el padre Parlan.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//He o�do que Lee ha conseguido solucionar el asunto.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//�Te has pasado al matar ovejas! �Largo!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Eres un abus�n. �Largo de aqu�!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//�Maldito ladr�n! �Me tienes harto!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//�Habr�a esperado algo m�s de un palad�n! A lord Hagen no le va a hacer ninguna gracia.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//�C�mo ha conseguido ingresar en la guardia de la ciudad alguien como t�? �Lord Andre te lo va a hacer pagar caro!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//�Lord Andre va a enterarse de lo que has hecho!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//�El padre Parlan se va a poner furioso por tu sacrilegio!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//�Lee no va a permitir que te salgas con la tuya!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Cuando se entere, el comandante Garond se va a cabrear. �Vas a pagarlo caro!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Pegas bastante fuerte... �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) �Alguna pregunta m�s?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//�Ya est�s otra vez!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 monedas de oro.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//� me trae sin cuidado...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//� nadie quiere saber nada...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//� as� lo quiso, �no?...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//� no tengo ni idea, d�melo t�...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//� voy a mantenerme al margen...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//� no tengo tiempo para esas cosas...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//� no podr�a salirme con la m�a...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//� no hace falta que me lo digas...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//� s� lo que es eso...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//� podr�a contarte muchas cosas...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//� no puedes fiarte de eso...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//� yo tambi�n sol�a decir eso...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//� y a�n hay m�s, cr�eme...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//� siempre lo mismo, una y otra vez...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//� dime que no es verdad...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//� tarde o temprano ten�a que pasar...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//� deb�a haberse andado con ojo...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//� eso no va a cambiar...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//� no es ning�n secreto...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//� no fue nada del otro mundo...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//� cree que est� chupado...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//� nadie quiere o�rlo...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//� y es la verdad...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//� mira lo que dice...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//� si no llega a ser por nosotros, todo habr�a sido distinto...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//� s�lo tiene que practicar m�s...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//� qu� sabr� �l de lo que es el deber...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//� Innos es justo a la hora de castigar...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//� el camino de la virtud es largo y escarpado...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//� s�lo Innos decide lo que est� bien y lo que est� mal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_10_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_10_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_10_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_10_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_10_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//�Ad�nde vas?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_10_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_10_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_10_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//�Qu� clase de ropa es esa? No te sienta nada bien. D�jame solo.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Si eres uno de los nuestros, deber�as vestir como nosotros. Vete a cambiarte.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Si alguien te da la armadura del Rey, es para que te la pongas.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Si reniegas de la t�nica, reniegas de Innos. Medita sobre eso.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Si no te puedes ni permitir una armadura, �por qu� deber�a hablar contigo?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//�Sucio bandido!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//�Pirata miserable!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(llamada) �Espera!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_11_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_11_Weather"						;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//�Por fin te tengo!
	DieEnemy					=	"SVM_11_DieEnemy"					;//�Ahora s� que te va a caer una buena!
	DieMonster					=	"SVM_11_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_11_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_11_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_11_SheepKiller"					;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_11_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//�Voy a tener que sacarte de aqu� a palos!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//�Qu� narices hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//�Una verdadera l�stima, piltrafa!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_11_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//�En el futuro, aparta las zarpas de lo que no sea asunto tuyo!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_11_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_11_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//�ALARMA!
	Guards						=	"SVM_11_Guards"						;//�GUARDIAS!
	Help						=	"SVM_11_Help"						;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(Alienta) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_11_GoodKill"					;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(Llama en voz alta) �Ah� quieto, pat�n!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//�Eso es, esf�mate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(Se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//�Oro! Muy bien, para empezar me lo quedo...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//�Ni siquiera tienes oro?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Creo que te voy a guardar el arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(A modo de advertencia) �Eh! �Cuidado!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(Con agresividad) �A�n no has tenido bastante?
	StopMagic					=	"SVM_11_StopMagic"					;//�Aparta tu magia de m�!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//�Basta de magia! �Te pasa algo en los o�dos?
	WeaponDown					=	"SVM_11_WeaponDown"					;//�Baja el arma!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//�Est�s sordo o qu�? �Te he dicho que bajes el arma!
	WiseMove					=	"SVM_11_WiseMove"					;//�Ves? Tampoco era tan dif�cil.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(Para s�) Ya veremos...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(Ansioso) �Por fin algo de acci�n!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(Abatido) Se est�n partiendo la cabeza ...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(Con una risa malvada) �Se lo ten�a merecido!
	NotBad						= 	"SVM_11_NotBad"						;//(Con aprobaci�n) No est� nada mal...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(Para s�) Qu� tipo m�s bestia...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//�S�, eso es!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//�A qu� esperas?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//�Vamos!
	Ooh01						=	"SVM_11_Ooh01"						;//�No le pases ni una!
	Ooh02						=	"SVM_11_Ooh02"						;//�D�jale claro qui�n manda!
	Ooh03						=	"SVM_11_Ooh03"						;//�La leche!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(Para s�, mientras se despierta) �Qu� ha pasado?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//�Sal de la cama!
	Awake						= "SVM_11_Awake"							;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//He o�do que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//He o�do que fuiste a ver al padre Parlan para arrepentirte de tus pecados.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Se rumorea que fuiste a ver a Lee para arreglar ese asunto.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//�Mira que matar nuestras ovejas como si tal cosa! �L�rgate, t�o!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//�No hablo con matones asquerosos!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//�Fuera de aqu�, ladr�n de mierda!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//�Eres una verg�enza para la orden! �Lord Hagen se va a poner furioso!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//�Eres una verg�enza para la guardia de la ciudad! �Lord Andre va a ense�arte modales!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//�Lord Andre se va a enterar de lo que has hecho!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//�El padre Parlan se va a enfadar cuando se entere!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//�Lee te va a dar una buena! �Te la vas a ganar!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//�El comandante Garond va a exigirte una explicaci�n!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//�Vale, vale, t� ganas! �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(Con suficiencia) �Tengo que volver a ense�arte qui�n manda?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//�Quieres pelearte otra vez conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 monedas de oro.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 monedas de oro.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 monedas de oro.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 monedas de oro.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 monedas de oro.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 monedas de oro.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 monedas de oro.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 monedas de oro.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 monedas de oro.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 monedas de oro.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 monedas de oro.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 monedas de oro.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 monedas de oro.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 monedas de oro.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 monedas de oro.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 monedas de oro.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 monedas de oro.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 monedas de oro.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 monedas de oro.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 monedas de oro.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 monedas de oro.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 monedas de oro.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 monedas de oro.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 monedas de oro.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 monedas de oro.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 monedas de oro.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 monedas de oro.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//� de veras crees...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//� todo es posible...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//� deb�a haberse andado con ojo...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//� como si no tuvi�ramos bastantes problemas...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//� �qui�n te lo cont�?...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//� s�lo causar� m�s problemas...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//� se ha o�do de todo...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//� yo no lo habr�a hecho...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//� no son m�s que rumores...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//� ser� mejor que tengamos cuidado de con qui�n hablamos...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//� eso podr�a hab�rtelo dicho yo...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//� nadie me pregunta...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//� el pobre da mucha pena...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//� no es ninguna novedad...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//� es evidente...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//� no hace falta que me lo preguntes...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//� ya sabes lo que opino...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//� eso es exactamente lo que dije...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//� no va a cambiar nada al respecto...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//� �por qu� no me he enterado antes?...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//� esperemos a ver qu� pasa...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//� algunos problemas se resuelven solos...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//� no quiero volver a o�rlo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//� se estaba emborrachando...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//� no voy a tolerar que me traten de ese modo...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//� todos huyeron como conejos y me qued� solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//� eso dicen las escrituras...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//� yo siempre act�o en el nombre de Innos...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//� nadie debe violar los mandatos divinos...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_11_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_11_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_11_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_11_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_11_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_11_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_11_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_11_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//�Qu� clase de ropa es esa? No te sienta nada bien. D�jame solo.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Haz el favor de llevar armadura cuando te hable. Vamos, l�rgate.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Se supone que debes llevar la armadura del Rey. Vamos, vete.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Tu ropa no es apropiada para nuestra orden. Ve a cambiarte.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Ni siquiera llevas armadura. �Largo!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Otro bandido.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//�PIRATAS!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_12_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_12_Weather"					;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//�Ya te tengo!
	DieEnemy					=	"SVM_12_DieEnemy"					;//�No debiste venir!
	DieMonster					=	"SVM_12_DieMonster"					;//�Ven aqu�, bestia asquerosa!
	DirtyThief					=	"SVM_12_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_12_HandsOff"					;//�Quita las zarpas de eso!
	SheepKiller					=	"SVM_12_SheepKiller"				;//�Deja en paz nuestras ovejas!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//�Ap�rtate de las ovejas, animal repugnante!
	YouMurderer					=	"SVM_12_YouMurderer"				;//�Asesino!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//�Te vas a arrepentir de esto!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//�Te lo advert�!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//�Te he dicho que te largues!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//�Eh! �Qu� hac�as ah� dentro?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//�Estate quieto de una vez!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//�Te voy a ensartar, cerdo!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Se te acab� la suerte...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//�Esto es la leche!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//�UN monstruo menos!
	ThiefDown					=	"SVM_12_ThiefDown"					;//�Te lo advierto! �No vuelvas a intentarlo, maldito ladr�n!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//�A partir de ahora, no te acerques a nuestras ovejas!
	KillMurderer				=	"SVM_12_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//�Maldita criatura est�pida!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//�Ni se te ocurra volver a atacarme!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//�Te lo advert�!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//Y ahora, �largo!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//No quiero volver a verte aqu�, �te enteras?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Aqu� no se pelea. �Que no se te olvide!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//�No cometas ninguna estupidez!
	RunAway						= 	"SVM_12_RunAway"						;//�Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//�ALARMA!
	Guards						=	"SVM_12_Guards"					;//�GUARDIAS!
	Help						=	"SVM_12_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(Anima) �Env�a a esas bestias al infierno!
	GoodKill					= 	"SVM_12_GoodKill"				;//(Grita) �Eso es, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(grita desaforadamente) �Ya me ocupar� de ti!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//�Aqu� no pintas nada!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//�Largo de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//�Qu� tramas? �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(Se despierta) Maldita sea, �qu� quieres?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Bueno, al menos tienes algo de oro.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Ni siquiera tienes oro. �Bah!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Creo que voy a quedarme con tu arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(A modo de advertencia) �Oye! �No se te ocurra volver a hacerlo!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(Con agresividad) �Quieres otra paliza?
	StopMagic					=	"SVM_12_StopMagic"				;//�Basta de magia!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//�Es la �ltima vez que te aviso! �Basta de magia!
	WeaponDown					=	"SVM_12_WeaponDown"				;//�Baja el arma!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//�Como no lo apartes, te la cargas!
	WiseMove					=	"SVM_12_WiseMove"				;//�Vaya, no eres tan tonto como pareces!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(Para s�) No vuelvas a intentarlo...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(Para s�) �Oh! Mi cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(�vido) Y ahora viene lo divertido...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(Abatido) Oh, cielos...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(Con una risa malvada) Que le sirva de escarmiento...
	NotBad						= 	"SVM_12_NotBad"					;//(Con aprobaci�n) �De lleno!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(Para s�) �Menudo animal!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//�Sac�dele!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//�Ahora no te pares!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//�Acaba con �l!
	Ooh01						=	"SVM_12_Ooh01"					;//�Cuidado!
	Ooh02						=	"SVM_12_Ooh02"					;//�Para el golpe!
	Ooh03						=	"SVM_12_Ooh03"					;//�Mierda, vaya golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(Para s�, mientras se despierta) �Qu� ha pasado?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_12_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//As� que el comandante ha hecho las paces contigo.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//As� que el padre Parlan te ha librado de tu culpa.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//As� que fuiste a ver Lee y solucionaste aquel asunto.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Bien.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//�Atacas a las ovejas? No has podido encontrar a otra v�ctima m�s indefensa, �eh?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//�No me trato con matones!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//�No quiero tener nada que ver con los ladrones!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//�Y quieres ser palad�n? �Ya ver�s lo que dice lord Hagen cuando se entere de esto!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//�De verdad perteneces a la guardia de la ciudad? �Lord Andre no va a tolerar esto!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Ve a ver a lord Andre mientras puedas.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Ve a ver al padre Parlan. Te ayudar� a expiar los pecados.
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee va a acabar enter�ndose, y vas a pagarlo caro.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Al comandante Garond no le va a gustar nada. Ser� mejor que hables con �l antes de que empeoren las cosas.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Muy bien, t� ganas. �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) Creo que ya sabes con qui�n te la est�s jugando. �Qu� quieres?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//�Otra vez t�? �Quieres volver a pelearte conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 monedas de oro.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//� me trae sin cuidado...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//� nadie quiere saber nada...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//� as� lo quiso, �no?...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//� no tengo ni idea, d�melo t�...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//� voy a mantenerme al margen...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//� no tengo tiempo para esas cosas...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//� no podr�a salirme con la m�a...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//� no hace falta que me lo digas...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//� s� lo que es eso...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//� podr�a contarte muchas cosas...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//� no puedes fiarte de eso...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//� yo tambi�n sol�a decir eso...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//� y a�n hay m�s, cr�eme...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//� siempre lo mismo, una y otra vez...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//� dime que no es verdad...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//� tarde o temprano ten�a que pasar...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//� deb�a haberse andado con ojo...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//� eso no va a cambiar...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//� no es ning�n secreto...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//� no fue nada del otro mundo...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//� cree que est� chupado...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//� nadie quiere o�rlo...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//� y es la verdad...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//� s�lo hay que prestar atenci�n...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//� si no llega a ser por nosotros, todo habr�a sido distinto...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//� s�lo tiene que practicar m�s...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//� qu� sabr� �l de lo que es el deber...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//� Innos es justo a la hora de castigar...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//� el camino de la virtud es largo y escarpado...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//� s�lo Innos decide lo que est� bien y lo que est� mal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//�Ves?, ya has mejorado...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_12_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_12_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_12_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_12_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_12_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_12_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_12_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_12_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Esa ropa no te sienta bien. Ve a cambiarte.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Si quieres hablar conmigo, ponte tu armadura.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//�Un soldado lleva la armadura del Rey, NO cualquier cosa! Ve a cambiarte.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Tu ropa no es apropiada para nuestra orden. Ve a cambiarte.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Ni siquiera puedes permitirte una armadura. Yo no hablo con pobretones.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//�Te har� trizas, bandido!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//�Te har� trizas, pirata!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_13_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_13_Weather"					;//�Qu� porquer�a de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//�Ya te tengo!
	DieEnemy					=	"SVM_13_DieEnemy"					;//�Te voy a hacer pedazos!
	DieMonster					=	"SVM_13_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_13_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_13_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_13_SheepKiller"				;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_13_YouMurderer"				;//�Asesino!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//�No quieres marcharte? �Vale!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//�Qu� hac�as ah� dentro?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//�Te lo ten�as merecido, pat�n!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_13_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea tuyo!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_13_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//�No me hagas da�o!
	RunAway						= 	"SVM_13_RunAway"					;//��Oh, mierda!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//�ALARMA!
	Guards						=	"SVM_13_Guards"					;//�GUARDIAS!
	Help						=	"SVM_13_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(Anima) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_13_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(Llama en voz alta) �S�! �Corre todo lo que puedas!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//�S�, l�rgate de aqu�!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(Se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//�A�n no has tenido bastante?
	StopMagic					=	"SVM_13_StopMagic"				;//�D�jate de magias!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Para ya!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_13_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(Para s�) Ya veremos la pr�xima vez...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(Para s�) Oh, t�o, me duele la cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(Con una risa malvada) �Le has ense�ado qui�n manda!
	NotBad						= 	"SVM_13_NotBad"					;//(Con aprobaci�n) No est� mal...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(Para s�) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//�Sac�dele!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//�Empl�ate a fondo!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//�Dale una lecci�n!
	Ooh01						=	"SVM_13_Ooh01"					;//�Espera!
	Ooh02						=	"SVM_13_Ooh02"					;//�Cuidado!
	Ooh03						=	"SVM_13_Ooh03"					;//�Vaya! �De lleno!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(Para s�, mientras se despierta) �Qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_13_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//As� que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//As� que fuiste a ver al padre Parlan para expiar tus pecados.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//As� que fuiste a ver a Lee para arreglar este asunto.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//�Mira que matar nuestras ovejas como si tal cosa!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//�D�jame en paz, animal!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//�D�jame en paz, miserable ladronzuelo!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//�Eres una verg�enza para la orden! �Ya ver�s cuando lord Hagen se entere!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//�Eres una verg�enza para la guardia de la ciudad! �Ya ver�s cuando lord Andre se entere!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Ya ver�s cuando lord Andre se entere.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//�Ya ver�s cuando el padre Parlan se entere!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Ya ver�s cuando Lee se entere de esto...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//�Ya ver�s cuando el comandante Garond se entere de esto!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Vale, vale, eres el mejor. �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(Con suficiencia) Supongo que, a estas alturas, eres consciente de qui�n es el m�s fuerte... �Qu� quieres?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Cre�a que quer�as pelearte conmigo. �Has cambiado de opini�n? �Prefieres HABLAR? (se r�e)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 monedas de oro.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//� me trae sin cuidado...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//� nadie quiere saber nada...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//� as� lo quiso, �no?...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//� no tengo ni idea, d�melo t�...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//� voy a mantenerme al margen...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//� no tengo tiempo para esas cosas...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//� no podr�a salirme con la m�a...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//� no hace falta que me lo digas...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//� s� lo que es eso...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//� podr�a contarte muchas cosas...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//� no puedes fiarte de eso...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//� yo tambi�n sol�a decir eso...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//� y a�n hay m�s, cr�eme...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//� siempre lo mismo, una y otra vez...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//� dime que no es verdad...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//� tarde o temprano ten�a que pasar...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//� deb�a haberse andado con ojo...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//� eso no va a cambiar...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//� no es ning�n secreto...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//� no fue nada del otro mundo...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//� cree que est� chupado...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//� nadie quiere o�rlo...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//� y es la verdad...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//� s�lo hay que prestar atenci�n...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//� si no llega a ser por nosotros, todo habr�a sido distinto...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//� s�lo tiene que practicar m�s...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//� qu� sabr� �l de lo que es el deber...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//� Innos es justo a la hora de castigar...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//� el camino de la virtud es largo y escarpado...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//� s�lo Innos decide lo que est� bien y lo que est� mal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_13_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_13_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_13_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_13_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_13_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_13_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_13_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_13_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//�Qu� clase de ropa es esa? No te sienta nada bien. D�jame solo.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//No llevas puesta la armadura. Ve a por ella.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Deber�as sentirte orgulloso de llevar la armadura del Rey, en vez de ir con esos andrajos. �L�rgate!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//�Por qu� no llevas el uniforme de la orden? Ve y medita sobre ello.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Ni siquiera llevas armadura. �Largo!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//�Sucio bandido!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//�Pirata miserable!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_14_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_14_Weather"						;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//�Por fin te tengo!
	DieEnemy					=	"SVM_14_DieEnemy"					;//�Ahora s� que te va a caer una buena!
	DieMonster					=	"SVM_14_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_14_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_14_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_14_SheepKiller"					;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_14_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//�Voy a tener que sacarte de aqu� a palos!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//�Qu� narices hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//�Una verdadera l�stima, piltrafa!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_14_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//�En el futuro, aparta las zarpas de lo que no sea asunto tuyo!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_14_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//�D�jame en paz!
	RunAway						= 	"SVM_14_RunAway"						;//�Mierda! �Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//�ALARMA!
	Guards						=	"SVM_14_Guards"						;//�GUARDIAS!
	Help						=	"SVM_14_Help"						;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(Anima) Muy bien. �Una bestia asquerosa menos!
	GoodKill					= 	"SVM_14_GoodKill"					;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(Llama en voz alta) �Ah� quieto, pat�n!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//�Eso es, esf�mate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(Se despierta) Maldita sea, �qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//�Oro! Muy bien, para empezar me lo quedo...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//�Ni siquiera tienes oro?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Creo que te voy a guardar el arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(A modo de advertencia) �Eh! �Cuidado!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(Con agresividad) �A�n no has tenido bastante?
	StopMagic					=	"SVM_14_StopMagic"					;//�Aparta tu magia de m�!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//�Basta de magia! �Te pasa algo en los o�dos?
	WeaponDown					=	"SVM_14_WeaponDown"					;//�Baja el arma!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//�Es que no me oyes? �Te he dicho que bajes el arma!
	WiseMove					=	"SVM_14_WiseMove"					;//�Ves? Tampoco era tan dif�cil.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(Para s�) Ya hablaremos de eso...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(Para s�) Oh, t�o, me duele la cabeza ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(Ansioso) �Por fin algo de acci�n!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(Abatido) Se est�n partiendo la cabeza ...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(Con una risa malvada) �Se lo ten�a merecido!
	NotBad						= 	"SVM_14_NotBad"						;//(Con aprobaci�n) No est� nada mal...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(Para s�) Qu� tipo m�s bestia...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//�S�, eso es!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//�A qu� esperas?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//�Vamos!
	Ooh01						=	"SVM_14_Ooh01"						;//�No le pases ni una!
	Ooh02						=	"SVM_14_Ooh02"						;//�D�jale claro qui�n manda!
	Ooh03						=	"SVM_14_Ooh03"						;//�La leche!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(Para s�, mientras se despierta) �Qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//�Sal de la cama!
	Awake						= "SVM_14_Awake"							;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//He o�do que fuiste a ver al comandante para arreglar las cosas.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//He o�do que fuiste a ver al padre Parlan para arrepentirte de tus pecados.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Se rumorea que fuiste a ver a Lee para arreglar ese asunto.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Muy bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//�Mira que matar nuestras ovejas como si tal cosa! �L�rgate, t�o!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//�No hablo con matones asquerosos!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//�Fuera de aqu�, ladr�n de mierda!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//�Eres una verg�enza para la orden! �Lord Hagen se va a poner furioso!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//�Eres una verg�enza para la guardia de la ciudad! �Lord Andre va a ense�arte modales!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//�Lord Andre se va a enterar de lo que has hecho!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//�El padre Parlan se va a enfadar cuando se entere!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//�Lee te va a dar una buena! �Te la vas a ganar!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//�El comandante Garond va a exigirte una explicaci�n!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//�Vale, vale, t� ganas! �Qu� quieres?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(Con suficiencia) �Tengo que volver a ense�arte qui�n manda?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//�Quieres pelearte otra vez conmigo?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 monedas de oro.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 monedas de oro.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 monedas de oro.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 monedas de oro.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 monedas de oro.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 monedas de oro.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 monedas de oro.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 monedas de oro.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 monedas de oro.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 monedas de oro.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 monedas de oro.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 monedas de oro.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 monedas de oro.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 monedas de oro.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 monedas de oro.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 monedas de oro.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 monedas de oro.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 monedas de oro.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 monedas de oro.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 monedas de oro.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 monedas de oro.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 monedas de oro.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 monedas de oro.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 monedas de oro.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 monedas de oro.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 monedas de oro.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 monedas de oro.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//� no me lo creo...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//� no estar�a tan seguro...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//� pero lo supo desde el primer momento...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//� ya no s� en qu� creer...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//� no s� por qu� se enfada tanto...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//� ya tengo bastantes problemas...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//� he escuchado un par de cosas...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//� no voy a entrar en eso...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//� no deber�as creerte todo lo que oyes...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//� no fui yo el que se lo cont�...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//� ya me lo imaginaba...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//� nadie quiere saber lo que opino...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//� la verdad es que no se lo merec�a...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//� no me digas que no lo sab�as...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//� resultaba evidente...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//� entonces, �d�nde te has enterado?...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//� esto no puede seguir as�...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//� me he formado mi propia opini�n al respecto...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//� ten�as raz�n...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//� no creo que esto vaya a cambiar...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//� �no sab�a nada!...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//� a ver qu� pasa...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//� sab�a que ser�a un problema...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//� �por qu� no me hacen caso?...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//� corri� como si le persiguiese el mism�simo Beliar...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//� claro que, despu�s de todo, le cogimos...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//� tienes que intervenir y solucionar el asunto...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//� algunos no saben lo malvados que son...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//� as� lo quiere Innos...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//� sus obras fueron justas...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_14_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_14_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_14_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_14_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_14_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_14_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_14_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_14_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Esa ropa no te va bien. Seguro que ocultas algo. D�jame en paz.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Si quieres halar conmigo, ve a ponerte nuestra armadura.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Enorgull�cete del ej�rcito y no vayas con esos andrajos. Ve a cambiarte enseguida.
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Tu vestimenta no es apropiada para nuestra orden. Ve a cambiarte.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Ni siquiera llevas armadura. �Largo!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Muere, bandido.
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Muere, pirata.
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//�Eh, t�!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//�Eh, t�!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//�Eh!
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//�Eh!
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//�Espera un momento!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//No funciona.
	PickBroke				= 	"SVM_15_PickBroke"					;//Um, se ha roto.
	NeedKey					= 	"SVM_15_NeedKey"					;//Necesito la llave...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Ya no quedan ganz�as...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//No s� abrir cerraduras.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//�Vamos a tardar un mont�n en barrer todas las alcobas!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Um... No tengo la llave, y tampoco una ganz�a.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//�No voy a poder abrirla sin la llave adecuada!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//�Me vendr�an bien unas cuantas ganz�as!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//�No voy a poder abrir este cacharro!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//�Con qu�?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Esto... No...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Nada que tomar�...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nada por aqu�...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nada que saquear...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Ay.
	Aargh_2					=	"SVM_15_Aargh_2"					;//Ay.
	Aargh_3					=	"SVM_15_Aargh_3"					;//Ay.
	Dead					=	"SVM_15_Dead"						;//Ay.
	Awake					=	"SVM_15_Awake"						;//(Se despierta)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//�Um! As� que ah� te escondes, y est� en el quinto infierno. Um. Para ir necesito un barco.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innos, soc�rreme y purifica este altar.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innos, conc�deme tu ayuda y todo eso... Ah� est�. Deber�a ser la �ltima vez.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//�XARAK BENDARDO! Ah. El libro est� abierto. Dentro hay escondidas una carta y una llave.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//�KHADOSH EMEM KADAR! ��brete!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Hagamos negocios.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Ens��ame tu mercanc�a.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Ens��ame lo que tienes.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Ya veo.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ah, creo que he encontrado algo.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//No comprendo
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//�No puedo leerlo!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//�AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//�JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//�URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(tos) �Ay, Dios! ��Brrr!!
	HUI						=	"SVM_15_Addon_HUI"						;//�Oh, oh, oh!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//�Qu� sabes sobre el intento de asesinato de Esteban?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//Sobre el ataque a Esteban
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Matar� a esos traidores.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Ando buscando a esos tipos para poder ir contra Esteban.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Te necesitan en la mina.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. �Aparece ante m�, Quarhodron, antiguo l�der del castillo guerreo!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Mmh... Aqu� no funciona.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//�Qu� tengo que saber sobre la extracci�n de oro?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Aj�. El libro de pagos de Francis. Parece que se ha embolsado mucho oro.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//�JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_16_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_16_Weather"						;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//�Por fin te tengo!
	DieEnemy					=	"SVM_16_DieEnemy"					;//�Ahora s� que te va a caer una buena!
	DieMonster					=	"SVM_16_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_16_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_16_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_16_SheepKiller"					;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_16_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//�Voy a tener que sacarte de aqu� a palos!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//�Qu� narices hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//�Una verdadera l�stima, piltrafa!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_16_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea asunto tuyo!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_16_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//�No me hagas da�o!
	RunAway						= 	"SVM_16_RunAway"						;//�Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//�ALARMA!
	Guards						=	"SVM_16_Guards"					;//�GUARDIAS!
	Help						=	"SVM_16_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(Alienta) �Muy bien!
	GoodKill					= 	"SVM_16_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(Llama en voz alta) �Detente, cobarde!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//�Eso es, esf�mate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(Se despierta) �Qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//�A�n no has tenido bastante?
	StopMagic					=	"SVM_16_StopMagic"				;//�D�jate de magias!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Estate quieto de una vez!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_16_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(Para s� misma) Ya veremos la pr�xima vez...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(Para s� misma) Oh t�o, me duele la cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(Ansioso) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(Abatido) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(Con una risa malvada) �Le has ense�ado qui�n manda!
	NotBad						= 	"SVM_16_NotBad"					;//(Con aprobaci�n) No est� mal ...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(Para s� misma) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//�Z�rrale!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//�Dale una buena!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//�Sac�dele en condiciones!
	Ooh01						=	"SVM_16_Ooh01"					;//�Devu�lvele el golpe!
	Ooh02						=	"SVM_16_Ooh02"					;//�Ten cuidado!
	Ooh03						=	"SVM_16_Ooh03"					;//�Oh! �Menudo golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(Para s� misma, mientras se despierta) �Qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_16_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//As� que fuiste a ver al comandante y limpiaste tu nombre.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//As� que fuiste a ver al padre Parlan y expiaste tus pecados.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee solucion� aquel asunto.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Muy bien.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//�No puedes matar nuestras ovejas como si tal cosa! �Largo!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Eres un animal y no quiero tener nada que ver contigo.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//No hablo con ladrones. �L�rgate!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Te comportaste de manera poco honorable. �A lord Hagen no le va a gustar!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//�Tu comportamiento es una verg�enza para la guardia de la ciudad! �Lord Andre exigir� una explicaci�n!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//�Lord Andre se va a enterar de lo que has hecho!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Obraste mal. Ve a ver al padre Parlan y arrepi�ntete.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//�Lee averiguar� lo que has hecho y te castigar�!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//�El comandante Garond va a exigirte una explicaci�n!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 monedas de oro.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//� �ah, s�? Qu� interesante...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//� no me lo creo...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//� eso no es lo que piensa mi marido...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//� vete, no me digas eso...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//� de verdad, lo vi con mis propios ojos...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//� no me digas...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//� no se lo cuentes a nadie...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//� corren malos tiempos...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//� �qui�n dice esas cosas? ...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//� si no lo hubiera visto con mis propios ojos...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//� alguien tiene que hacerlo...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//� eso no es lo que he escuchado...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//� no pod�a fallar...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//� no puede guardar un secreto...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//� habr�a hecho bien en callarse...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//� y tambi�n trabaja todo el d�a...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//� no puedo ocuparme de todo...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//� habla demasiado...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//� es un secreto a voces...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//� a estas alturas lo sabe todo el mundo...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//� a partir de ahora no voy a contarle nada...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//� y va a ir a peor...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//� pero eso es terrible...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//� es lo que siempre he dicho...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_16_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_16_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_16_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_16_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_16_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_16_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_16_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_16_Aargh_3"					;//Ay.
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Ponte algo decente. No quiero verte as�.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//�UN BANDIDO!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//�UN PIRATA!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//�Por el rey!
	PALGreetings				=	"SVM_17_PALGreetings"				;//�Por Innos!
	Weather						= 	"SVM_17_Weather"						;//�Qu� espanto de tiempo!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//�Por fin te tengo!
	DieEnemy					=	"SVM_17_DieEnemy"					;//�Ahora s� que te va a caer una buena!
	DieMonster					=	"SVM_17_DieMonster"					;//�Ah� hay otra de esas bestias asquerosas!
	DirtyThief					=	"SVM_17_DirtyThief"					;//�Ladr�n de mierda! �Te vas a enterar!
	HandsOff					=	"SVM_17_HandsOff"					;//�Aparta las zarpas!
	SheepKiller					=	"SVM_17_SheepKiller"					;//�Esa basura est� matando a nuestras ovejas!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//�Ese maldito monstruo se est� zampando las ovejas!
	YouMurderer					=	"SVM_17_YouMurderer"					;//�Asesino!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//�Aqu� no queremos bestias!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//�Te vas a enterar, hijo de mala madre!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//�T� lo has querido!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//�Voy a tener que sacarte de aqu� a palos!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//�Qu� narices hac�as ah� dentro, eh?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//�Vas a estarte quieto de una vez?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//�Muere, cerdo!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//�Una verdadera l�stima, piltrafa!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//�Un monstruo menos!
	ThiefDown					=	"SVM_17_ThiefDown"					;//�No vuelvas a intentar robarme!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//�A partir de ahora, aparta las zarpas de lo que no sea asunto tuyo!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//�No vuelvas a hacerlo! �Esas ovejas son nuestras!
	KillMurderer				=	"SVM_17_KillMurderer"				;//�Muere, asesino!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//�Maldita bestia est�pida!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//�No vuelvas a pelearte conmigo!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//�Ten�as que haberme hecho caso!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//�Y, ahora, largo de aqu�!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//�Que no vuelva a pillarte aqu� dentro!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Aqu� no se pelea, �te enteras? �Que te sirva de escarmiento!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//�No me hagas da�o!
	RunAway						= 	"SVM_17_RunAway"						;//�Me largo!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//�ALARMA!
	Guards						=	"SVM_17_Guards"					;//�GUARDIAS!
	Help						=	"SVM_17_Help"					;//�Socorro!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(Alienta) �Muy bien!
	GoodKill					= 	"SVM_17_GoodKill"				;//(Alienta) �S�, dale una buena a ese cerdo!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//�D�jame en paz!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(Llama en voz alta) �Detente, cobarde!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//�Largo de aqu�!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//�Qu� haces aqu�? �Largo!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//�Eso es, esf�mate!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//�Eh, t�! �Qu� haces rondando por aqu�?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(Se despierta) �Qu� pasa?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//�Gracias por el oro, h�roe!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//El pobre diablo ni siquiera tiene oro.
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Deber�a quedarme con esta arma..
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(A modo de advertencia) �Cuidado! Como lo vuelvas a hacer, te sacudo.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//�A�n no has tenido bastante?
	StopMagic					=	"SVM_17_StopMagic"				;//�D�jate de magias!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//�Quieres que te d� una paliza? ���Estate quieto de una vez!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//��Quieres apartar esa maldita arma?!
	WiseMove					=	"SVM_17_WiseMove"				;//�Chico listo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(Para s� misma) Ya veremos la pr�xima vez...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(Para s� misma) Oh t�o, me duele la cabeza...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(Ansiosa) �Ah, una pelea!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(Abatida) �Oh Dios m�o, una pelea!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(Con una risa malvada) �Le has ense�ado qui�n manda!
	NotBad						= 	"SVM_17_NotBad"					;//(Con aprobaci�n) No est� mal ...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(Para s� misma) �Dios m�o! Qu� bestia...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//�Z�rrale!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//�Dale una buena!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//�Sac�dele en condiciones!
	Ooh01						=	"SVM_17_Ooh01"					;//�Devu�lvele el golpe!
	Ooh02						=	"SVM_17_Ooh02"					;//�Ten cuidado!
	Ooh03						=	"SVM_17_Ooh03"					;//�Oh! �Menudo golpe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(Para s� misma, mientras se despierta) �Qu� ha sido eso?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//�Sal de la cama!
	Awake						= "SVM_17_Awake"					;//(Bostezo sonoro)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//As� que fuiste a ver al comandante y limpiaste tu nombre.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//As� que fuiste a ver al padre Parlan y expiaste tus pecados.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee solucion� aquel asunto.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Muy bien.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//�No puedes matar nuestras ovejas como si tal cosa! �Largo!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Eres un animal y no quiero tener nada que ver contigo.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//No hablo con ladrones. �L�rgate!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Te comportaste de manera poco honorable. �A lord Hagen no le va a gustar!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//�Tu comportamiento es una verg�enza para la guardia de la ciudad! �Lord Andre exigir� una explicaci�n!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//�Lord Andre se va a enterar de lo que has hecho!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Obraste mal. Ve a ver al padre Parlan y arrepi�ntete.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//�Lee averiguar� lo que has hecho y te castigar�!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//�El comandante Garond va a exigirte una explicaci�n!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 monedas de oro.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 monedas de oro.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 monedas de oro.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 monedas de oro.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 monedas de oro.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 monedas de oro.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 monedas de oro.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 monedas de oro.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 monedas de oro.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 monedas de oro.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 monedas de oro.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 monedas de oro.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 monedas de oro.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 monedas de oro.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 monedas de oro.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 monedas de oro.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 monedas de oro.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 monedas de oro.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 monedas de oro.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 monedas de oro.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 monedas de oro.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 monedas de oro.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 monedas de oro.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 monedas de oro.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 monedas de oro.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 monedas de oro.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 monedas de oro.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 monedas de oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//� �ah, s�? Qu� interesante...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//� no me lo creo...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//� eso no es lo que piensa mi marido...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//� vete, no me digas eso...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//� de verdad, lo vi con mis propios ojos...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//� no me digas...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//� no se lo cuentes a nadie...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//� corren malos tiempos...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//� �qui�n dice esas cosas? ...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//� si no lo hubiera visto con mis propios ojos...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//� alguien tiene que hacerlo...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//� eso no es lo que he escuchado...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//� no pod�a fallar...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//� no puede guardar un secreto...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//� habr�a hecho bien en callarse...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//� y tambi�n trabaja todo el d�a...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//� no puedo ocuparme de todo...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//� habla demasiado...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//� es un secreto a voces...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//� a estas alturas lo sabe todo el mundo...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//� a partir de ahora no voy a contarle nada...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//� y va a ir a peor...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//� pero eso es terrible...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//� es lo que siempre he dicho...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Vuelve cuando tengas m�s experiencia.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Pides m�s de lo que te puedo ense�ar.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//No te puedo ense�ar nada m�s. Te has vuelto demasiado bueno.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//�Ves?, ya has mejorado ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Est�s en la parte baja de la ciudad.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Est�s en la parte alta de la ciudad.
	TEMPEL						= "SVM_17_TEMPEL"					;//Est�s en el templo.
	MARKT						= "SVM_17_MARKT"						;//Est�s en el mercado.
	GALGEN						= "SVM_17_GALGEN"					;//Est�s en la plaza de la horca, delante del cuartel.
	KASERNE						= "SVM_17_KASERNE"					;//Esto es el cuartel.
	HAFEN						= "SVM_17_HAFEN"						;//Est�s en el distrito del puerto.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//�Ad�nde quieres ir?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Desde aqu�, si cruzas la puerta interior de la ciudad llegar�s a la parte baja de la ciudad.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//La puerta meridional de la ciudad est� unida, mediante un tramo de escaleras, con la puerta interior. Ah� empieza la parte alta de la ciudad.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//El paso subterr�neo que sale de la herrer�a te llevar� a la plaza del templo.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Para ir al puerto, tienes que coger el camino del puerto que sale de la herrer�a.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Hay un paso subterr�neo que lleva a la parte baja de la ciudad desde la plaza del templo.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Cuando est�s delante del templo, sube hacia la izquierda siguiendo la muralla de la ciudad y llegar�s al mercado.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Desde el templo, en cuanto pases la taberna, que est� a la izquierda, llegar�s a la plaza de la horca.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Si sigues la muralla alta de la ciudad desde el mercado llegar�s al templo.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//El edificio grande es el cuartel. Sube por las escaleras que est�n enfrente del hotel.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Si coges el callej�n desde la plaza de la horca saldr�s a la plaza del templo.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//En cuanto dejes atr�s el cuartel grande llegar�s a la plaza de la horca.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//El edificio grande es el cuartel. Sube las escaleras.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//En la entrada principal, ve a la izquierda, baja las escaleras y llegar�s al mercado.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//En la entrada principal, ve a la derecha, baja las escaleras y llegar�s a la plaza de la horca.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Si subes por el camino del puerto desde la muralla del muelle llegar�s a la parte baja de la ciudad.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//�Aaaaay!
	Aargh_1						= "SVM_17_Aargh_1"					;//Ay.
	Aargh_2						= "SVM_17_Aargh_2"					;//Ay.
	Aargh_3						= "SVM_17_Aargh_3"					;//Ay.
	
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(Dice entre dientes) �Ah� est�!
	RunCoward    	= "SVM_19_RunCoward"    	;//(Dice entre dientes) �Ya te cogeremos!
	Dead      		= "SVM_19_Dead"      	;//�Aaaaay!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Ay.
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Ay.
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Ay.
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




