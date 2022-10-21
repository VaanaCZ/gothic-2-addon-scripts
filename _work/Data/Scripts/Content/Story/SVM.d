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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_1_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_1_Weather"						;//Quel sale temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//Je vous ai enfin mis la main dessus !
	DieEnemy					=	"SVM_1_DieEnemy"					;//Vous n'allez pas y couper !
	DieMonster					=	"SVM_1_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_1_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_1_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_1_SheepKiller"					;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_1_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Attendez un peu saloperie !
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Alors je vais devoir vous DEGAGER de l� !
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//Alors quel �tait VOTRE r�le dans tout �a, hein ?
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Voulez-vous arr�ter imm�diatement !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//Tant pis pour toi, vermine !
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_1_ThiefDown"					;//N'essayez plus jamais de me voler !
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_1_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//Et maintenant, sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Laissez-moi tranquille !
	RunAway						= 	"SVM_1_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALERTE !
	Guards						=	"SVM_1_Guards"						;//A LA GARDE !
	Help						=	"SVM_1_Help"						;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(Il s'exclame) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_1_GoodKill"					;//(il crie) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(injonction) Restez o� vous �tes, vermine !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Ouais, �loignez-vous de moi !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(au r�veil) Merde, qu'y a-t-il?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//De l'or ! Je me sers en premier...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Ce b�tard n'a m�me pas d�or sur lui !
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Je pense que je vais garder votre arme � l'abri.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(avertissement) H� ! Attention !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(agressif) Vous n'en avez pas encore assez ?
	StopMagic					=	"SVM_1_StopMagic"					;//Eloignez-vous de moi avec votre magie !
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Arr�tez votre magie ! Vous �tes sourd ou quoi ?
	WeaponDown					=	"SVM_1_WeaponDown"					;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Vous �tes sourd ou quoi ? J'ai dit : Posez cette arme !
	WiseMove					=	"SVM_1_WiseMove"					;//Vous voyez, ce n'�tait pas si difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(� lui-m�me) On verra �a...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(impatient) Passons � l'action.
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(constern�) Ils se fracassent la t�te...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(rire malfaisant) Il le m�ritait !
	NotBad						= 	"SVM_1_NotBad"						;//(d'un ton approbateur) Pas mal du tout...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(� lui-m�me) Quelle brute...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Voil� ce qu'il nous faut !
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Qu'est-ce que vous attendez ?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Vas-y mon gars !
	Ooh01						=	"SVM_1_Ooh01"						;//Merdez pas !
	Ooh02						=	"SVM_1_Ooh02"						;//Montrez-lui qui est le patron !
	Ooh03						=	"SVM_1_Ooh03"						;//Oh ! Merde !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(au r�veil) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Sortez de mon lit !
	Awake						= "SVM_1_Awake"							;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//J'ai entendu dire que vous aviez r�gl� le probl�me avec le commandant.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//J'ai entendu dire que vous vous �tiez confess� aupr�s du p�re Parlan.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Ils ont dit que vous aviez r�gl� cette affaire avec Lee.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Massacrer nos moutons comme �a ! Boucher !
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Je ne parle pas aux brutes crasseuses !
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Hors de ma vue, sale voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Vous �tes une honte pour notre ordre ! Le seigneur Hagen sera furieux !
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Le seigneur Andr� vous apprendra les bonnes mani�res !
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Le seigneur Andr� saura ce que vous avez fait !
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Le p�re Parlan ne sera pas content d'entendre parler de ce sacril�ge !
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Lee va vous donner ce que vous m�ritez ! Vous verrez bien o� cela va vous mener !
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Le commandant Garond exigera que vous vous expliquiez !
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//Tr�s bien, tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(D'un ton suffisant) Dois-je encore vous montrer qui est le patron ?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Vous essayez encore de me provoquer, n'est-ce pas ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 pi�ces d'or.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 pi�ces d'or.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 pi�ces d'or.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 pi�ces d'or.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 pi�ces d'or.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 pi�ces d'or.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 pi�ces d'or.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 pi�ces d'or.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 pi�ces d'or.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 pi�ces d'or.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 pi�ces d'or.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 pi�ces d'or.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 pi�ces d'or.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 pi�ces d'or.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 pi�ces d'or.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 pi�ces d'or.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 pi�ces d'or.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 pi�ces d'or.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 pi�ces d'or.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 pi�ces d'or.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 pi�ces d'or.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 pi�ces d'or.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 pi�ces d'or.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 pi�ces d'or.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 pi�ces d'or.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 pi�ces d'or.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 pi�ces d'or.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//... pensez-vous vraiment que...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//... tout est possible...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//... il aurait d� le savoir...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//... comme si je n'avais pas assez de probl�mes...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//... qui a dit que...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//... cela ne fera que provoquer plus d'ennuis...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//... il y a eu tout un tas de rumeurs...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//... je n'aurai pas fait �a...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//... ce ne sont que des rumeurs...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//... il serait sage de faire attention � qui vous en parlez...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//... j'aurais pu vous le dire...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//... personne ne me demande mon avis...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//... on ne peut que se sentir d�sol� pour ce pauvre type...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//... �a n'a rien de nouveau...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//... c'est absolument �vident...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//... vous n'avez pas � me le demander...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//... vous savez d�j� ce que j'en pense...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//... c'est exactement ce que j'ai dit...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//... rien n'y changera quoi que ce soit...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//... pourquoi n'en ai-je jamais entendu parler...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//... attendons et voyons ce qui va se passer...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//... certains probl�mes se r�solvent d�eux-m�mes...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//... je ne veux plus entendre �a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//... il �tait ivre mort...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//... je refuse d'�tre trait� comme �a...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//... ils ont tous d�tal� comme des lapins, je me suis retrouv� tout seul...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//... ainsi est-il dit dans les saintes �critures...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//... j'agis toujours au nom d'Innos...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//... personne ne doit violer l'ordre divin...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_1_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_1_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_1_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_1_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_1_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Ce grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du rempart des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Ces v�tements ne sont pas les v�tres. Je ne vous parlerai pas.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Qu'est-ce que vous portez ? Habillez-vous correctement !
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Vous �tes un soldat ! Habillez-vous comme tel !
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Votre tenue ne sied pas � notre ordre. Allez vous changer.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Vous n'avez m�me pas d'armure. Fichez le camp !

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Meurs, vil bandit !
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Fumier de pirate !
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_3_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_3_Weather"					;//Quel temps de merde !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Je vous tiens !
	DieEnemy					=	"SVM_3_DieEnemy"					;//Je vais vous mettre en pi�ces !
	DieMonster					=	"SVM_3_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_3_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_3_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_3_SheepKiller"				;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_3_YouMurderer"				;//Assassin !
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Attendez un peu saloperie !
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Vous ne voulez pas partir ? Tr�s bien !
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Qu'est-ce que vous cherchez ?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Vous allez arr�ter �a ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Tu l'as m�rit�, vermine !
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_3_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_3_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//Et maintenant, sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Ne me faites pas de mal !
	RunAway						= 	"SVM_3_RunAway"					;//Oh ! Merde !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALERTE !
	Guards						=	"SVM_3_Guards"					;//A LA GARDE !
	Help						=	"SVM_3_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(exclamation) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_3_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(en criant) Oui ! Courez aussi vite que vous le pouvez !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Qu'est-ce que vous voulez ? Partez !
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Ouais, �loignez-vous de moi !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(en se r�veillant) Merde, qu'y a-t-il ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//N'en avez-vous pas encore assez ?
	StopMagic					=	"SVM_3_StopMagic"				;//Arr�tez avec ces conneries magiques !
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez �a tout de suite !!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_3_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(� lui-m�me) Bon, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(impatient) Aah ! Un combat !
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(constern�) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_3_GoodVictory"			;//(rire mal�fique) Vous lui avez montr� qui �tait le patron !
	NotBad						= 	"SVM_3_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(� lui-m�me) Mon Dieu ! Quelle brutalit�...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Allez !
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Faites-lui voir ce que vous valez !
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Montrez-lui !
	Ooh01						=	"SVM_3_Ooh01"					;//Attendez !
	Ooh02						=	"SVM_3_Ooh02"					;//Faites attention !
	Ooh03						=	"SVM_3_Ooh03"					;//Ouah ! En plein dans le mille !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_3_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Ainsi, vous avez r�gl� le probl�me avec le commandant ?
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Ainsi, p�re Parlan vous a absout ?
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Ainsi vous avez r�gl� le probl�me avec Lee.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Massacrer nos moutons de la sorte !
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Laissez-moi tranquille, sale brute !
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Laissez-moi tranquille, mis�rable voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Vous �tes une honte pour notre ordre ! Attendez que le seigneur Hagen en entende parler !
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Vous �tes une honte pour la garde de la ville ! Attendez que le seigneur Andr� en entende parler !
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Attendez que le seigneur Andr� entende parler de �a.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Attendez que le p�re Parlan entende parler de �a !
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Attendez que Lee ait vent de cette affaire...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Attendez que le commandant Garond entende parler de �a!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Tr�s bien, tr�s bien, vous �tre le meilleur combattant. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(avec suffisance) Je pr�sume que, maintenant, vous savez qui de nous deux est le plus fort... Que voulez-vous ?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Je croyais que vous vouliez me provoquer. Vous avez chang� d'avis ? Vous pr�f�rez PARLER, n'est-ce pas ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 pi�ces d'or.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//... pensez-vous vraiment que...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//... tout est possible...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//... il aurait d� le savoir...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//... comme si je n'avais pas assez de probl�mes...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//... qui vous a dit que...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//... cela ne fera que provoquer plus d'ennuis...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//... il y a eu tout un tas de rumeurs...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//... je n'aurais jamais pens�...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//... ce ne sont que des rumeurs...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//... vous feriez bien de faire attention � qui vous en parlez...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//... j'aurais pu vous le dire...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//... personne ne me demande mon avis...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//... on ne peut que se sentir d�sol� pour ce pauvre type...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//... �a n'a rien de nouveau...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//... c'est absolument �vident...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//... vous n'avez pas � me le demander...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//... vous savez d�j� ce que j'en pense...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//... c'est exactement ce que j'avais dit...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//... rien n'y changera quoi que ce soit...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//... pourquoi n'en ai-je jamais entendu parler...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//... attendons et voyons ce qui va se passer...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//... certains probl�mes se r�solvent d�eux-m�mes...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//... je ne veux plus entendre �a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//... il �tait ivre mort...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//... je refuse d'�tre trait� comme �a...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//... ils ont tous d�tal� comme des lapins, je me suis retrouv� tout seul...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//... ainsi est-il dit dans les saintes �critures...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//... j'agis toujours au nom d'Innos...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//... personne ne doit violer l'ordre divin...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_3_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_3_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_3_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_3_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_3_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Qu'est-ce que c'est que cette tenue ? �a ne vous va pas du tout. Laissez-moi tranquille.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Si vous voulez qu'on parle, allez d'abord enfiler une tenue correcte !
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//Nous autres soldats portons nos uniformes avec fiert�. Allez vous changer !
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//Nous sommes tous �gaux dans notre ordre, et nous portons donc tous la m�me tenue. Allez vous changer !
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Vous venez de sortir de prison ?! Allez d'abord vous trouver des v�tements acceptables !

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//VIENS ICI, FUMIER DE BANDIT !
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//VIENS ICI, FUMIER DE PIRATE !
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_4_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_4_Weather"						;//Quel sale temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//Encore VOUS !
	DieEnemy					=	"SVM_4_DieEnemy"					;//Je vais vous mettre en pi�ces !
	DieMonster					=	"SVM_4_DieMonster"					;//Encore une de ces choses !
	DirtyThief					=	"SVM_4_DirtyThief"					;//Mis�rable canaille !
	HandsOff					=	"SVM_4_HandsOff"					;//�tez vos pattes de l� !
	SheepKiller					=	"SVM_4_SheepKiller"					;//Eh ! Laissez nos moutons tranquilles !
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Ce monstre avale nos moutons !
	YouMurderer					=	"SVM_4_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//Que fait CETTE cr�ature ici ?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//Vous allez en prendre pour votre grade !
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Vous l'avez cherch�.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Il semble que certaines personnes ne comprennent pas autre chose que la force.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Qu'est-ce que vous venez faire ici, hein ?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Voulez-vous arr�ter imm�diatement !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Meurs !
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Quel stupide b�tard...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//Tr�s bien, vous l'aurez voulu, b�te r�pugnante !
	ThiefDown					=	"SVM_4_ThiefDown"					;//A partir de maintenant gardez vos sales pattes loin de mes affaires, compris ?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Gardez vos mains dans vos poches � partir de maintenant !
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Ne touchez plus nos moutons avec vos sales pattes !
	KillMurderer				=	"SVM_4_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Ne refaites plus jamais �a !
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Que cela vous serve de le�on.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Debout et sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Je ne veux plus jamais vous voir ici, compris ?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//C'est moi qui donne les claques par ici, compris ?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Laissez-moi tranquille !
	RunAway						= 	"SVM_4_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALERTE !
	Guards						=	"SVM_4_Guards"					;//A LA GARDE !
	Help						=	"SVM_4_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(exclamation) Ouais ! C'est comme �a qu'il faut faire avec ces choses !
	GoodKill					= 	"SVM_4_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(cri) Vous n'en avez pas fini avec moi !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Dehors !
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Qu�est-ce qui vous am�ne ici ?
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Fichez le camp !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Qu'est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(en se r�veillant) Qu'esse qu'y a ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(agressif) Vous voulez que je vous en colle un autre ?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Arr�tez imm�diatement ces conneries magiques !
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez �a tout de suite !!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_4_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(� lui-m�me) Bon, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(impatient) Ah ! Un combat !
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(constern�) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_4_GoodVictory"				;//(rire mal�fique) Vous lui avez montr� qui �tait le patron !
	NotBad						= 	"SVM_4_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(� lui-m�me) Mon Dieu ! Quelle brutalit�...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Ouais, achevez-le !
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Montrez-lui !
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_4_Ooh01"					;//D�fendez-vous !
	Ooh02						=	"SVM_4_Ooh02"					;//Allez, ripostez !
	Ooh03						=	"SVM_4_Ooh03"					;//Ouch ! �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(en se r�veillant) Bordel, qu'est-ce que c'�tait ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Sortez de mon lit !
	Awake						= "SVM_4_Awake"						;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Ainsi le commandant a arrang� les choses avec vous.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Ainsi vous avez fait p�nitence aupr�s du p�re Parlan ?
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//J'ai entendu dire que Lee vous avait arrang� le coup.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Bien.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Massacrer nos moutons est la goutte d�eau qui fait d�border le vase ! Allez vous faire voir !
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Vous n'�tes qu'un voyou, allez vous faire voir !
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Maudit voleur ! J'en ai assez de vous !
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Je m'attendais � une autre attitude de la part d'un paladin ! Cela ne plaira pas au seigneur Hagen.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Le seigneur Andr� vous fera regretter �a !
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Le seigneur Andr� entendra parler de votre attitude !
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Votre sacril�ge rendra la p�re Parlan furieux !
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Lee ne vous laissera pas l'emporter au paradis !
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Le commandant Garond ne sera pas content, vous paierez pour �a.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//J'admets que vous avez du punch... Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(d'un air suffisant) D'autres questions ?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//Encore vous !
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 pi�ces d'or.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//... est-ce vraiment la v�rit�...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//... ce n'est pas ce que j'ai entendu...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//... ne me dites pas que vous ne saviez pas �a...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//... il est difficile de savoir qui croire ces jours-ci...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//... ce ne sont que des ragots...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//... je ne vaux pas mieux...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//... rien ne me fascine tant...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//... ce n'est vraiment pas mon probl�me...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//... pensez-vous vraiment que...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//... on ne tirera rien de moi...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//... �a a toujours �t� une �vidence...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//... Il a �cout� les mauvaises personnes...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//... s'il ne s'en rend pas compte lui-m�me, je ne peux rien pour lui...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//... je ne vous apprends rien de nouveau...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//... il n'y aurait jamais pens� lui-m�me...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//... c'est connu depuis longtemps...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//... c'est une sale affaire...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//... je m'y serais pris d'une autre mani�re...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//... je suis enti�rement d'accord avec vous...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//... est-ce que cela changera un jour...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//... je ne m'en serais jamais dout�...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//... on n'y peut rien...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//... cela ne m'�tonne pas...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//... mais non, il pensait encore avoir raison...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//�tout ce qui compte, c'est la force, alors ne me dites pas �a...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//... il ne savait m�me pas comment manier une �p�e...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//... oui, c'est vraiment ce qu'il a dit...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//... quelqu'un va devoir payer pour �a...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos �claire tous ceux qui reconnaissent sa sagesse...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//... � la fin, la justice pr�vaudra...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Je ne peux plus rien vous apprendre. Vous �tes trop dou�.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_4_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_4_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_4_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_4_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_4_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du rempart des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Allez d'abord vous habiller correctement. Ensuite, nous pourrons discuter.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Si vous voulez vous adresser � moi, vous avez int�r�t � porter votre armure !
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Personne ne vous a remis une armure ? Dans ce cas, trouvez-vous en une !
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//O� est votre robe ? Allez vous changer. D'ici l�, je ne vous adresserai pas la parole.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Quel pauvre goret vous faites ! Revenez me voir quand vous aurez de quoi vous payer une armure !

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Un bandit !
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Fumier de pirate !
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_5_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_5_Weather"						;//Quel temps d�gueulasse !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//Je vous ai enfin mis la main dessus !
	DieEnemy					=	"SVM_5_DieEnemy"					;//Vous allez en prendre pour votre grade !
	DieMonster					=	"SVM_5_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_5_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_5_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_5_SheepKiller"					;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_5_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Attendez un peu, saloperie !
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Alors je vais devoir vous DEGAGER de l� !
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Alors quel �tait VOTRE r�le dans tout �a, hein ?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Allez vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Tant pis pour toi, vermine !
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_5_ThiefDown"					;//N'essayez plus jamais de me voler !
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_5_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Laissez-moi tranquille !
	RunAway						= 	"SVM_5_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALERTE !
	Guards						=	"SVM_5_Guards"						;//A LA GARDE !
	Help						=	"SVM_5_Help"						;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(exclamation) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_5_GoodKill"					;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(injonction) Restez o� vous �tes, vermine !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Ouais, �loignez-vous de moi !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(en se r�veillant) Merde, qu'y a-t-il ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//De l'or ! Je me sers en premier...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Vous n'avez m�me pas une pi�ce d'or sur vous ?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Je pense que je vais garder votre arme � l'abri.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(avertissement) H� ! Attention !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(agressif) Vous n'en avez pas encore assez ?
	StopMagic					=	"SVM_5_StopMagic"					;//Eloignez-vous de moi avec votre magie !
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Arr�tez votre magie ! Vous �tes sourd ou quoi ?
	WeaponDown					=	"SVM_5_WeaponDown"					;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Vous �tes sourd ou quoi ? J'ai dit : Posez cette arme !
	WiseMove					=	"SVM_5_WiseMove"					;//Vous voyez, ce n'�tait pas si difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(� lui-m�me) On verra �a...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(tr�pidant) Passons � l'action.
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(constern�) Mais ils se fracassent le cr�ne...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(rire malfaisant) Il le m�ritait !
	NotBad						= 	"SVM_5_NotBad"						;//(d'un ton approbateur) Pas mal du tout...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(� lui-m�me) Quelle brute...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Voil� ce qu'il nous faut !
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Qu'est-ce que vous attendez ?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Vas-y, mon gars !
	Ooh01						=	"SVM_5_Ooh01"						;//Merdez pas !
	Ooh02						=	"SVM_5_Ooh02"						;//Montrez-lui qui est le patron !
	Ooh03						=	"SVM_5_Ooh03"						;//Oh ! Merde !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Sortez de mon lit !
	Awake						= "SVM_5_Awake"							;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//J'ai entendu dire que vous aviez r�gl� le probl�me avec le commandant.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//J'ai entendu dire que vous �tiez all� voir le p�re Parlan pour faire p�nitence.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//J'ai entendu dire que vous �tiez all� voir Lee pour r�gler les choses.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Massacrer nos moutons comme �a ! Boucher !
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Je ne parle pas aux brutes crasseuses !
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Hors de ma vue, sale voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Vous �tes une honte pour notre ordre ! Le seigneur Hagen sera furieux !
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Vous �tes une honte pour la garde de la ville ! Le seigneur Andr� vous apprendra les bonnes mani�res !
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Le seigneur Andr� saura ce que vous avez fait !
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Le p�re Parlan ne sera pas content d'entendre parler de ce sacril�ge !
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee va vous donner ce que vous m�ritez ! Vous verrez bien o� cela va vous mener !
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Le commandant Garond exigera que vous vous expliquiez !
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//Tr�s bien, tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(D'un ton suffisant) Dois-je encore vous montrer qui est le patron ?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Vous essayez encore de me provoquer, n'est-ce pas ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 pi�ces d'or.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 pi�ces d'or.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 pi�ces d'or.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 pi�ces d'or.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 pi�ces d'or.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 pi�ces d'or.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 pi�ces d'or.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 pi�ces d'or.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 pi�ces d'or.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 pi�ces d'or.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 pi�ces d'or.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 pi�ces d'or.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 pi�ces d'or.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 pi�ces d'or.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 pi�ces d'or.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 pi�ces d'or.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 pi�ces d'or.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 pi�ces d'or.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 pi�ces d'or.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 pi�ces d'or.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 pi�ces d'or.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 pi�ces d'or.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 pi�ces d'or.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 pi�ces d'or.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 pi�ces d'or.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 pi�ces d'or.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 pi�ces d'or.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//... pensez-vous vraiment que...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//... tout est possible...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//... il aurait d� le savoir...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//... comme si je n'avais pas assez de probl�mes...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//... qui vous a dit que...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//... cela ne fera que provoquer plus d'ennuis...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//... il y a eu tout un tas de rumeurs...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//... je n'aurai pas fait �a...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//... ce ne sont que des rumeurs...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//... il serait sage de faire attention � qui vous en parlez...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//... j'aurais pu vous le dire...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//... personne ne me demande mon avis...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//... on ne peut que se sentir d�sol� pour ce pauvre type...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//... �a n'a rien de nouveau...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//... c'est totalement �vident...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//... vous n'avez pas � me le demander...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//... vous savez d�j� ce que j'en pense...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//... c'est exactement ce que j'ai dit...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//... rien n'y changera quoi que ce soit...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//... pourquoi n'en ai-je jamais entendu parler...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//... attendons et voyons ce qui va se passer...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//... certains probl�mes se r�solvent d�eux-m�mes...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//... je ne veux plus entendre �a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//... il �tait ivre mort...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//... je refuse d'�tre trait� comme �a...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//... ils ont tous d�tal� comme des lapins, je me suis retrouv� tout seul...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//... ainsi est-il dit dans les saintes �critures...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//... j'agis toujours au nom d'Innos...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//... personne ne doit violer l'ordre divin...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_5_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_5_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_5_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_5_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_5_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Allez d'abord enfiler quelque chose de convenable.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//Qu'est-ce que vous portez ? Vous n'�tes plus l'un des n�tres ? Dans ce cas, je n'ai plus rien � vous dire !
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//Nous autres soldats combattons pour le roi, donc vous avez tout int�r�t � porter son armure !
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Pourquoi l'ordre vous a-t-il remis une tenue si vous ne la portez pas ?
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Quel pauvre paum� vous faites ! Vous n'avez m�me pas d'armure - fichez le camp !

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Ah, un bandit.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Je vais te mettre en pi�ce, pirate !
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_6_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_6_Weather"					;//Putain de temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//J'aurai ta peau !
	DieEnemy					=	"SVM_6_DieEnemy"					;//Vous n'auriez pas d� venir ici !
	DieMonster					=	"SVM_6_DieMonster"					;//Viens ici, sale b�te !
	DirtyThief					=	"SVM_6_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_6_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_6_SheepKiller"				;//Laissez nos moutons tranquilles !
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Eloignez-vous de nos moutons, esp�ce de brute !
	YouMurderer					=	"SVM_6_YouMurderer"				;//Assassin !
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Vous le regretterez !
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Je vous avais averti !
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Eh ! SORTEZ !
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Eh ! Que venez-vous faire ici ?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Arr�tez ! Imm�diatement !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Je vais vous embrocher, b�tard !
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Voil� pour vous !
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Eh ! J'ai toujours la main !
	ThiefDown					=	"SVM_6_ThiefDown"					;//Je vous pr�viens ! Ne me faites plus ce coup-l�, sale voleur !
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//Et � partir de maintenant ne vous approchez plus de nos moutons !
	KillMurderer				=	"SVM_6_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//N'essayez m�me plus de vous en prendre encore � moi !
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Je vous avais averti !
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//Et maintenant, sortez !
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Je ne veux plus jamais vous voir ici, capisce ?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Pas de combat ici. Que cela vous serve de le�on.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Ne faites pas le malin !
	RunAway						= 	"SVM_6_RunAway"						;//Je d�gage d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALERTE !
	Guards						=	"SVM_6_Guards"					;//A LA GARDE !
	Help						=	"SVM_6_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(exclamation) Envoyez ces b�tes ad patres !
	GoodKill					= 	"SVM_6_GoodKill"				;//(exclamation) Ouais, donnez � ce b�tard ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(en criant) Je vous aurai !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Vous n'avez rien � faire ici !
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Ouais, sortez !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Qu�est-ce que vous manigancez ? Pourquoi vous fouinez dans le coin ?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(en se r�veillant) Quoi, qu'est-ce que vous voulez ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Bon, au moins vous avez un peu d'or sur vous.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//M�me pas un peu d'or, pff !
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Je crois que je vais prendre votre arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(avertissement) Mon gars ! Ne faites plus jamais �a !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(agressif) Vous voulez encore une racl�e ?
	StopMagic					=	"SVM_6_StopMagic"				;//Arr�tez avec cette magie !
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Dernier avertissement ! Arr�tez avec cette magie !
	WeaponDown					=	"SVM_6_WeaponDown"				;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Rangez �a ou vous allez y avoir droit !
	WiseMove					=	"SVM_6_WiseMove"				;//Eh ! Vous n'�tes pas aussi stupide que vous en avez l'air !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(� lui-m�me) Ne refaites plus jamais �a...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(� lui-m�me) Oh ! Ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(avide) Et maintenant on va rigoler...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(constern�) Oh la vache...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(rire malfaisant) Que cela lui serve de le�on...
	NotBad						= 	"SVM_6_NotBad"					;//(approbateur) En plein dans le mille !
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(� lui-m�me) Quelle sale brute !
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Tapez-lui dessus !
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Ne vous arr�tez pas !
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_6_Ooh01"					;//Faites attention !
	Ooh02						=	"SVM_6_Ooh02"					;//Eh bien, parez !
	Ooh03						=	"SVM_6_Ooh03"					;//Merde, �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_6_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Ainsi le commandant vous a arrang� le coup.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Le p�re Parlan vous a absout de votre faute.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Alors vous �tes all� voir Lee et vous avez r�gl� le probl�me.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Bien.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Vous vous en prenez aux moutons ? Vous n'avez pas trouv� de victimes plus inoffensives ?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Je n'ai rien � faire avec des voyous !
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Je n'ai rien � faire avec des voleurs !
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//Et vous voulez devenir paladin ? Attendez de savoir ce que va en penser le seigneur Hagen !
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Vous appartenez vraiment � la garde de la ville ? Je doute que le seigneur Andr� tol�re �a !
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Allez voir le seigneur Andr� tant que vous le pouvez encore.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Allez voir le p�re Parlan. Il vous aidera � expier vos p�ch�s !
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee va en entendre parler et vous aller payer.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Cela ne va pas faire rire le commandant Garond. Vous feriez mieux d'aller lui parler avant que les choses n'empirent !
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(sur un ton hautain) Je crois que maintenant vous savez � qui vous avez � faire. Que voulez-vous ?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Encore vous? Vous voulez encore vous battre avec moi ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 pi�ces d'or.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//... je n'arrive pas � croire que...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//... je n'en serais pas aussi certain...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//... mais il l'a toujours su...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//... je ne sais plus que croire...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//... je ne sais pas pourquoi il �tait aussi �nerv�...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//... j'ai assez d�ennuis comme �a...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//... j'avais entendu parler d'une ou deux choses...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//... je ne touche pas � �a...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//... vous ne devriez pas croire tout ce que vous entendez...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//... ce n'est pas de moi qu'il le tient...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//... c'est ce que j'ai toujours pens�...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//... personne ne me demande jamais mon avis...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//... il ne m�ritait vraiment pas �a...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//... ne dites pas que vous ne saviez pas...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//... c'�tait l'�vidence m�me...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//... d'o� tenez-vous �a...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//... j'ai mon propre avis sur le sujet...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//... c'�tait exactement comme vous l'aviez dit...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//... je ne crois pas que cela changera...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...c'est la premi�re fois que j'en entends parler...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//� il ne nous reste plus qu'� attendre...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//... je savais que cela poserait probl�me...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//... alors pourquoi refusent-ils de m'�couter...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//... il courait comme si B�liar en personne �tait � ses trousses...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//... bien naturellement, on a fini par l'avoir...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//... vous devez prendre le taureau par les cornes et arranger les choses...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//... il y en a qui ne se rendent m�me pas compte de leur vilenie...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//... car telle est la volont� d'Innos...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//... ses exploits n'�taient que...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_6_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_6_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_6_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_6_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_6_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//Vous avez l'air idiot dans ce d�guisement ! Allez enfiler une tenue acceptable.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Mais n'allez pas croire que je ne vous ai pas reconnu. Fichez le camp et allez vous changer !
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Dites donc, soldat, qu'est-ce que c'est que cette tenue ?! Changez-vous imm�diatement !
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Un serviteur d'Innos ne se dissimule pas. Allez chercher votre robe.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Vous vous baladez d�guis� en mineur. Allez d'abord enfiler une tenue correcte !

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//T'as cherch� des ennuis � la mauvaise personne, BANDIT !
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Retourne en mer, PIRATE !
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_7_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_7_Weather"						;//Quel sale temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Encore VOUS !
	DieEnemy					=	"SVM_7_DieEnemy"					;//Je vais vous mettre en pi�ces !
	DieMonster					=	"SVM_7_DieMonster"					;//Encore une de ces choses !
	DirtyThief					=	"SVM_7_DirtyThief"					;//Mis�rable canaille !
	HandsOff					=	"SVM_7_HandsOff"					;//�tez vos pattes de l� !
	SheepKiller					=	"SVM_7_SheepKiller"					;//Eh ! Laissez nos moutons tranquilles !
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Ce monstre avale nos moutons !
	YouMurderer					=	"SVM_7_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//Que fait CETTE cr�ature ici ?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Vous allez en prendre pour votre grade !
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Vous l'avez cherch�.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Il semble que certaines personnes ne comprennent pas autre chose que la force.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Qu'est-ce que vous venez faire ici, hein ?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Voulez-vous arr�ter imm�diatement !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Meurs !
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Quel stupide b�tard...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Tr�s bien, vous l'aurez voulu, b�te r�pugnante !
	ThiefDown					=	"SVM_7_ThiefDown"					;//A partir de maintenant, gardez vos sales pattes loin de mes affaires, compris ?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Gardez vos mains dans vos poches � partir de maintenant !
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Ne touchez plus nos moutons avec vos sales pattes !
	KillMurderer				=	"SVM_7_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Ne refais jamais �a, ducon !
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Que cela vous serve de le�on.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Debout et sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Je ne veux plus jamais vous voir ici, compris ?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//C'est moi qui donne les claques par ici, compris ?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Laissez-moi tranquille !
	RunAway						= 	"SVM_7_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALERTE !
	Guards						=	"SVM_7_Guards"					;//A LA GARDE !
	Help						=	"SVM_7_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(exclamation) Ouais ! C'est comme �a qu'il faut faire avec ces choses !
	GoodKill					= 	"SVM_7_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(cri) Vous n'en avez pas fini avec moi !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Dehors !
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Qu�est-ce qui vous am�ne ici ?
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Fichez le camp !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Qu'est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(en se r�veillant) Qu'esse qu'y'a ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(agressif) Vous voulez que je vous en colle un autre ?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Arr�tez imm�diatement ces conneries magiques !
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez �a tout de suite !!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_7_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(� lui-m�me) Bon, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(impatient) Ah ! Un combat !
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(constern�) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_7_GoodVictory"				;//(rire mal�fique) Vous lui avez montr� qui �tait le patron !
	NotBad						= 	"SVM_7_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(� lui-m�me) Mon Dieu ! Quelle brutalit�...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Ouais, achevez-le !
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Montrez-lui !
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_7_Ooh01"					;//D�fendez-vous !
	Ooh02						=	"SVM_7_Ooh02"					;//Allez, ripostez !
	Ooh03						=	"SVM_7_Ooh03"					;//Ouch ! �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(en se r�veillant) Bordel, qu'est-ce que c'�tait ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Sortez de mon lit !
	Awake						= "SVM_7_Awake"						;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Ainsi le commandant a arrang� les choses avec vous.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Ainsi vous avez fait p�nitence aupr�s du p�re Parlan ?
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//J'ai entendu dire que Lee vous avait arrang� le coup.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Bien.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Massacrer nos moutons est la goutte d�eau qui fait d�border le vase ! Allez vous faire voir !
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Vous n'�tes qu'un voyou, allez vous faire voir !
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Maudit voleur ! J'en ai assez de vous !
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Je m'attendais � une autre attitude de la part d'un paladin ! Cela ne plaira pas au seigneur Hagen.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Comment quelqu'un comme vous a-t-il pu entrer dans la garde de la ville? Le seigneur Andr� vous fera regretter �a !
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Le seigneur Andr� entendra parler de votre attitude !
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Votre sacril�ge rendra le p�re Parlan furieux !
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee ne vous laissera pas l'emporter au paradis !
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Le commandant Garond ne sera pas content, vous paierez pour �a.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//J'admets que vous avez du punch... Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(d'un air suffisant) D'autres questions ?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//Encore vous !
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 pi�ces d'or.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//... est-ce vraiment la v�rit�...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//... ce n'est pas ce que j'ai entendu...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//... ne me dites pas que vous ne saviez pas �a...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//... il est difficile de savoir qui croire ces jours-ci...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//... ce ne sont que des ragots...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//... je ne vaux pas mieux...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//... rien ne me fascine tant...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//... ce n'est vraiment pas mon probl�me...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//... pensez-vous vraiment que...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//... on ne tirera rien de moi...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//... �a a toujours �t� une �vidence...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//... Il a �cout� les mauvaises personnes...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//... s'il ne s'en rend pas compte lui-m�me, je ne peux rien pour lui...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//... je ne vous apprends rien de nouveau...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//... il n'y aurait jamais pens� lui-m�me...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//... c'est connu depuis longtemps...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//... c'est une sale affaire...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//... j'aurais abord� le probl�me diff�remment...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//... je suis enti�rement d'accord avec vous...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//... est-ce que cela changera un jour...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//... je ne m'en serais jamais dout�...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//... on ne peut rien y faire...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//... cela ne me surprend gu�re...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//... mais non, il pensait encore avoir raison...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//... La force n'est pas tout ce qui compte, alors ne me dites pas �a...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//... il ne savait m�me pas comment manier une �p�e...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//... oui, c'est vraiment ce qu'il a dit...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//... quelqu'un va devoir payer pour �a...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos �claire tous ceux qui reconnaissent sa sagesse...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//... � la fin, la justice pr�vaudra...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Je ne peux plus rien vous apprendre. Vous �tes trop dou�.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_7_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_7_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_7_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_7_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_7_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Pourquoi ce d�guisement ? Hors de question que je vous parle dans cette tenue !
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//Qu'est-ce que c'est que cette tenue ! Voulez-vous bien imm�diatement enfiler votre armure ?!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//Votre tenue constitue une infraction au code vestimentaire de l'arm�e. Allez vous changer � l'instant !
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Vous avez tout int�r�t � porter votre robe. D'ici l�, je ne vous dirai rien, et je prierai pour vous.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Que voulez-vous ? Vous n'�tes pas un des n�tres. Vous ne portez m�me pas notre armure.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Meurs, m�prisable bandit !
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Meurs, m�prisable pirate !
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_8_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_8_Weather"					;//Quel temps de merde !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Je vous tiens !
	DieEnemy					=	"SVM_8_DieEnemy"					;//Je vais vous mettre en pi�ces !
	DieMonster					=	"SVM_8_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_8_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_8_HandsOff"					;//Bas les pattes !
	SheepKiller					=	"SVM_8_SheepKiller"				;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_8_YouMurderer"				;//Assassin !
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Attendez un peu saloperie !
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Vous ne voulez pas partir ? Tr�s bien !
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Qu'est-ce que vous cherchez ?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Allez-vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Tu l'as m�rit�, vermine !
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_8_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_8_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Ne me faites pas de mal !
	RunAway						= 	"SVM_8_RunAway"					;//Oh ! Merde !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALERTE !
	Guards						=	"SVM_8_Guards"					;//A LA GARDE !
	Help						=	"SVM_8_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(exclamation) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_8_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(en criant) C'est �a ! Cours aussi vite que tu peux !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Ouais, �loignez-vous de moi !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(en se r�veillant) Merde, qu'y a-t-il ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Merci pour l'or, mon h�ros !
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//N'en avez-vous pas encore assez ?
	StopMagic					=	"SVM_8_StopMagic"				;//Arr�tez avec ces conneries magiques !
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez �a tout de suite !!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_8_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(� lui-m�me) Bon, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(tr�pignant) Aah ! Un combat !
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(constern�) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_8_GoodVictory"			;//(rire malfaisant) Vous lui avez fait voir !
	NotBad						= 	"SVM_8_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(� lui-m�me) Mon Dieu ! Quelle brutalit�...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Allez !
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Faites-lui voir ce que vous valez !
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Montrez-lui !
	Ooh01						=	"SVM_8_Ooh01"					;//Attendez !
	Ooh02						=	"SVM_8_Ooh02"					;//Faites attention !
	Ooh03						=	"SVM_8_Ooh03"					;//Ouch ! En plein dans le mille !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_8_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Ainsi, vous avez r�gl� le probl�me avec le commandant.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Ainsi, le p�re Parlan vous a absout ?
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Ainsi vous avez r�gl� le probl�me avec Lee.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Massacrer nos moutons de la sorte !
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Laissez-moi tranquille, sale brute !
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Laissez-moi tranquille, mis�rable voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Vous �tes une honte pour notre ordre ! Attendez que le seigneur Hagen en entende parler !
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Vous �tes une honte pour la garde de la ville ! Attendez que le seigneur Andr� en entende parler !
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Attendez que le seigneur Andr� entende parler de �a.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Attendez que le p�re Parlan entende parler de �a !
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Attendez que Lee ait vent de cette affaire...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Attendez que le commandant Garond entende parler de �a !
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Tr�s bien, tr�s bien, vous �tes le meilleur combattant. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(avec suffisance) Je pr�sume que, maintenant, vous savez qui de nous deux est le plus fort... Que voulez-vous ?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Je croyais que vous vouliez me provoquer. Vous avez chang� d'avis ? Vous pr�f�rez PARLER, n'est-ce pas ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 pi�ces d'or.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//... est-ce vraiment la v�rit�...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//... ce n'est pas ce que j'ai entendu...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//... ne me dites pas que vous ne saviez pas �a...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//... il est difficile de savoir qui croire ces jours-ci...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//... ce ne sont que des ragots...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//... je ne vaux pas mieux...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//... plus rien ne me surprend...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//... ce n'est vraiment pas mon probl�me...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//... pensez-vous vraiment que...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//... on ne tirera rien de moi...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//... �a a toujours �t� une �vidence...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//... Il a �cout� les mauvaises personnes...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//... s'il ne s'en rend pas compte lui-m�me, je ne peux rien pour lui...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//... je ne vous apprends rien de nouveau...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//... il n'y aurait jamais pens� lui-m�me...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//... c'est connu depuis longtemps...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//... c'est une sale affaire...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//... j'aurais abord� le probl�me diff�remment...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//... je suis enti�rement d'accord avec vous...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//... est-ce que cela changera un jour...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//... je ne m'en serais jamais dout�...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//... on ne peut rien y faire...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//... cela ne me surprend gu�re...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//... mais non, il pensait encore avoir raison...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//... la force n'est pas tout ce qui compte, alors ne me dites pas �a...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//... il ne savait m�me pas comment manier une �p�e...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//... oui, c'est vraiment ce qu'il a dit...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//... quelqu'un va devoir payer pour �a...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos �claire tous ceux qui reconnaissent sa sagesse...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//... � la fin, la justice pr�vaudra...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Je ne peux plus rien vous apprendre. Vous �tes trop dou�.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_8_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_8_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_8_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_8_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_8_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Je n'ai aucune confiance en vous. Il y a quelque chose en vous ou en votre tenue qui me d�range.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//A voir votre tenue, vous n'�tes pas l'un des n�tres ! Dans ce cas, je n'ai rien � voir avec vous !
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Nous devons imposer notre pr�sence, alors allez chercher votre armure sur-le-champ.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos nous commande de porter notre robe avec fiert�. Allez vous changer !
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Je ne parle pas aux mineurs. Vous n'avez m�me pas d'armure digne de ce nom?

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Fumier de bandit !
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//DES PIRATES !
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_9_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_9_Weather"						;//Putain de temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Je vous tiens !
	DieEnemy					=	"SVM_9_DieEnemy"					;//Vous n'auriez jamais d� venir ici !
	DieMonster					=	"SVM_9_DieMonster"					;//Venez l�, esp�ce de sale b�tard !
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Encore une de ces b�tes !
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Encore une de ces b�tes infectes !
	DirtyThief					=	"SVM_9_DirtyThief"					;//Sale voleur ! Attendez un peu !
	HandsOff					=	"SVM_9_HandsOff"					;//Retirez vos sales pattes !
	SheepKiller					=	"SVM_9_SheepKiller"				;//Laissez nos moutons tranquilles !
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Eloignez-vous de nos moutons, sale chien !
	YouMurderer					=	"SVM_9_YouMurderer"				;//Assassin !
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Vous le regretterez !
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Je vous avais pr�venu !
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//J'ai dit DEHORS !
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Eh ! Que faisiez-vous ici ?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Arr�tez ! A l'instant !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Je vais vous embrocher, b�tard !
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//C'en est fait de vous...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Schei�e!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//C'en est fini de toi, salet� !
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//Un monstre de moins sur ces terres !
	ThiefDown					=	"SVM_9_ThiefDown"					;//Je vous avertis ! Ne refaites plus jamais �a, sale voleur !
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//Et � partir de maintenant ne vous approchez plus de nos moutons !
	KillMurderer				=	"SVM_9_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//Quelle cr�ature stupide !
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//N'essayez m�me plus de vous en prendre encore � moi !
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Je vous avais pr�venu !
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//Et maintenant, hors d'ici !
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Je ne veux plus jamais vous voir ici, vous m'avez compris ?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//N'oubliez pas qu'aucun combat n'est tol�r� ici !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Ne faites rien de stupide !
	RunAway						= 	"SVM_9_RunAway"						;//Je d�gage d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALERTE !
	Guards						=	"SVM_9_Guards"					;//A LA GARDE !
	Help						=	"SVM_9_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(exclamation) Envoyez ces b�tes ad patres !
	GoodKill					= 	"SVM_9_GoodKill"				;//(en criant) Ouais, faites-lui voir � ce b�tard !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(en hurlant) Je vous aurai !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Vous n'avez rien � faire ici !
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Ouais, sortez d'ici !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Qu�est-ce que vous mijotez ? Qu'est-ce que vous faites � fouiner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(en se r�veillant) Quoi, qu'est-ce que vous voulez ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Bon, au moins vous avez un peu d'or sur vous.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//M�me pas un peu d'or, pff.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Je crois que je vais prendre votre arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(avertissement) Mon gars ! Ne faites plus jamais �a !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(agressif) Encore une petite correction ?
	StopMagic					=	"SVM_9_StopMagic"				;//Arr�tez avec cette magie !
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Dernier avertissement ! Arr�tez avec cette magie !
	WeaponDown					=	"SVM_9_WeaponDown"				;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Rangez �a ou vous allez y avoir droit !
	WiseMove					=	"SVM_9_WiseMove"				;//Eh ! Vous n'�tes pas aussi stupide que vous en avez l'air !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(� lui-m�me) Ne refaites plus jamais �a...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(� lui-m�me) Oh ! Ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(avide) Et maintenant on va rigoler...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(constern�) Oh la vache...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(rire malfaisant) Que cela lui serve de le�on...
	NotBad						= 	"SVM_9_NotBad"					;//(approbateur) En plein dans le mille !
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(� lui-m�me) Quelle sale brute !
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Tapez-lui dessus !
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Ne vous arr�tez pas !
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_9_Ooh01"					;//Faites attention !
	Ooh02						=	"SVM_9_Ooh02"					;//Eh bien, parez !
	Ooh03						=	"SVM_9_Ooh03"					;//Merde, �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_9_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Ainsi le commandant vous a arrang� le coup.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Le p�re Parlan vous a absout de vos fautes.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Ainsi vous avez vu Lee et vous avez r�gl� cette affaire.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Bien.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Vous vous en prenez aux moutons ? Vous n'avez pas trouv� de victimes plus inoffensives ?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Je n'ai rien � faire avec des voyous !
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Je n'ai rien � faire avec des voleurs !
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//Alors vous voulez devenir paladin ? Attendez de savoir ce qu'en pense le seigneur Hagen !
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Vous appartenez vraiment � la garde de la ville ? Je doute que le seigneur Andr� tol�re �a !
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Allez voir le seigneur Hagen tant que vous le pouvez.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Allez voir le p�re Parlan. Il vous aidera � expier vos p�ch�s !
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee va en �tre inform� et vous devrez payer.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Cela ne va pas faire rire le commandant Garond. Vous feriez mieux d'aller lui parler avant que les choses n'empirent !
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(Sur un ton hautain) Je crois que maintenant vous savez � qui vous avez � faire. Que voulez-vous ?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//Encore vous ? Vous voulez encore vous battre avec moi ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 pi�ces d'or.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//... je n'arrive pas � y croire...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//... je n'en serais pas aussi certain...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//... mais il l'a toujours su...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//... je ne sais plus que croire...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//... je ne sais pas pourquoi il �tait aussi �nerv�...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//... j'ai assez d�ennuis comme �a...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//... j'ai entendu dire une ou deux choses...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//... je ne touche pas � �a...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//... vous ne devriez pas croire tout ce que vous entendez...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//... ce n'est pas de moi qu'il le tient...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//... c'est ce que j'ai toujours pens�...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//... personne ne me demande jamais mon avis...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//... il ne m�ritait vraiment pas �a...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//... ne dites pas que vous ne saviez pas...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//... c'�tait �vident...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//... d'o� tenez-vous �a...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//... j'ai mon avis sur le sujet...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//... c'�tait exactement comme vous l'aviez dit...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//... je ne crois pas que cela changera...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//... c'est la premi�re fois que j'en entends parler...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//... nous ne pouvons qu'attendre et voir...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//... je savais que cela poserait probl�me...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//... alors pourquoi refusent-ils de m'�couter...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//... il courait comme si B�liar en personne �tait � ses trousses...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//... bien naturellement, on a fini par l'avoir...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//... vous devez prendre le taureau par les cornes et arranger les choses...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//... il y en a qui ne se rendent m�me pas compte de leur vilenie...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//... car telle est la volont� d'Innos...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//... ses exploits n'�taient que...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes devenu trop bon.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_9_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_9_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_9_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_9_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_9_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous conduira � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Descendre la rue qui part de la forge vous conduira au port.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Si vous laissez le pub sur votre gauche en venant du temple, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Qu'est-ce que c'est que ce d�guisement ?! Allez enfiler une tenue de circonstance.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//Qu'est-ce que vous portez l� ? Voulez-vous bien mettre votre armure imm�diatement !
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Vous travaillez pour le roi, alors je vous conseille de porter son armure. Allez vous changer.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Votre tenue ne convient pas � notre ordre. Allez vous changer.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Vous n'avez m�me pas d'armure... Fichez le camp !

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//Ton heure est venue, bandit !
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Tu n'aurais jamais d� te montrer ici, pirate !
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_10_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_10_Weather"						;//Quel sale temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//Encore VOUS !
	DieEnemy					=	"SVM_10_DieEnemy"					;//Je vais vous mettre en pi�ces !
	DieMonster					=	"SVM_10_DieMonster"					;//Encore une de ces choses !
	DirtyThief					=	"SVM_10_DirtyThief"					;//Mis�rable canaille !
	HandsOff					=	"SVM_10_HandsOff"					;//�tez vos pattes de �a !
	SheepKiller					=	"SVM_10_SheepKiller"					;//Eh ! Laissez nos moutons tranquilles !
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Ce monstre avale nos moutons !
	YouMurderer					=	"SVM_10_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//Que fait CETTE cr�ature ici ?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//Vous allez en prendre pour votre grade !
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Vous l'avez cherch�.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Il semble que certaines personnes ne comprennent pas autre chose que la force.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Qu'est-ce que vous venez faire ici, hein ?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Voulez-vous arr�ter imm�diatement !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Meurs !
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Quel stupide b�tard...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//Tr�s bien, vous l'aurez voulu, b�te r�pugnante !
	ThiefDown					=	"SVM_10_ThiefDown"					;//A l'avenir ne touchez plus � mes affaires, compris ?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Gardez vos mains dans vos poches � partir de maintenant !
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Ne touchez plus nos moutons avec vos sales pattes !
	KillMurderer				=	"SVM_10_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//Quelle cr�ature stupide !
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Ne recommencez jamais �a !
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Que cela vous serve de le�on.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Debout et sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Je ne veux plus jamais vous voir ici, compris ?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//C'est moi qui donne les claques par ici, compris ?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Laissez-moi tranquille !
	RunAway						= 	"SVM_10_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALERTE !
	Guards						=	"SVM_10_Guards"					;//A LA GARDE !
	Help						=	"SVM_10_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(exclamation) Ouais ! C'est comme �a qu'il faut faire avec ces choses !
	GoodKill					= 	"SVM_10_GoodKill"				;//(exclamation) C'est ce que ce porc m�ritait !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(cri) Vous n'en avez pas fini avec moi !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Dehors !
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Qu�est-ce qui vous am�ne ici ?
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Ouais, cognez-le !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Qu'est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(en se r�veillant) Qu'esse qu'y'a ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Esp�ce de sombre idiot, tu n'as m�me pas d'or sur toi !
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Je pense que je vais mettre cette arme � l'abri !
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(avertissement) Attention ! Encore une fois et je vous tape dessus .
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(agressif) Vous voulez que je vous en colle un autre ?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Arr�tez imm�diatement ces conneries magiques !
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Vous voulez vraiment une correction ? Arr�tez imm�diatement !!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Rangez cette arme imm�diatement !
	WiseMove					=	"SVM_10_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(� lui-m�me) Nous verrons la prochaine fois...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(� lui-m�me) Oh ! Ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(impatient) Aah ! Un combat !
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(constern�) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_10_GoodVictory"				;//(avec un rire malfaisant) Vous lui en avez fait voir !
	NotBad						= 	"SVM_10_NotBad"					;//(admiratif) Pas mal...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(� lui-m�me) Mon Dieu ! Quelle brutalit�...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Ouais, achevez-le !
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Montrez-lui !
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_10_Ooh01"					;//D�fendez-vous !
	Ooh02						=	"SVM_10_Ooh02"					;//Allez, ripostez !
	Ooh03						=	"SVM_10_Ooh03"					;//Ouch ! �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(en se r�veillant) Bordel, qu'est-ce que c'�tait ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Sortez de mon lit !
	Awake						= "SVM_10_Awake"						;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Ainsi le commandant a arrang� les choses avec vous.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Ainsi vous avez fait p�nitence aupr�s du p�re Parlan ?
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//J'ai entendu dire que Lee vous avait arrang� le coup.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//C'est honn�te.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Massacrer nos moutons est la goutte d�eau qui fait d�border le vase ! Allez vous faire voir !
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Vous n'�tes qu'un voyou, allez vous faire voir !
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Maudit voleur ! J'en ai assez de vous !
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Je m'attendais � une autre attitude de la part d'un paladin ! Cela ne plaira pas au seigneur Hagen.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Comment quelqu'un comme vous a-t-il pu entrer dans la garde de la ville? Le seigneur Andr� vous fera regretter �a !
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Le seigneur Andr� entendra parler de votre attitude !
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Votre sacril�ge rendra le p�re Parlan furieux !
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Lee ne vous laissera pas l'emporter au paradis !
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Le commandant Garond ne sera pas content, vous paierez pour �a.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//J'avoue que vous avez un sacr� punch... Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(d'un air suffisant) D'autres questions ?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//Encore vous !
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 pi�ces d'or.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//... je m'en fiche �perdument...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//... personne ne veut savoir...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//... c'�tait son choix, n'est-ce pas...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//... aucune id�e, dites-moi...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//... je ne veux pas m'en m�ler...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//... je n'ai pas le temps de m'occuper de ce genre de choses...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//... je n'aurais pas pu m'en tirer...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//... vous n'avez pas � me dire �a...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//... allez ici, faites cela...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//... toutes les choses que je pourrais vous dire...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//... vous ne pouvez pas vous fier � �a...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//... c'est ce que j'avais l'habitude de dire...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//... et ce n'est pas termin�, croyez-moi...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//... toujours la m�me chose encore et encore...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//... dites-moi que ce n'est pas vrai...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//... cela devait arriver t�t ou tard...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//... il aurait d� r�fl�chir...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//... �a ne changera jamais...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//... ce n'est pas un secret...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//... �a n'avait rien d'extraordinaire...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//... il pense que c'est aussi simple que �a...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//... personne ne souhaite entendre �a ...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//... et c'est la v�rit�...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//... �coutez-le juste parler...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//... s'il n'avait tenu qu'� nous, les choses auraient pu tourner diff�remment...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//... il a simplement besoin de s'entra�ner davantage...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//... que sait-il du devoir...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//... Innos inflige de justes sanctions...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//... la voie de la vertu est difficile et sem�e d�emb�ches...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//... seul Innos peut d�cr�ter ce qui est bien ou mal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville
	TEMPEL						= "SVM_10_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_10_MARKT"						;//Vous �tes sur la place du march
	GALGEN						= "SVM_10_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_10_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_10_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//O� allez-vous ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Qu'est-ce que c'est que cette tenue ? �a ne vous va pas du tout. Laissez-moi tranquille.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Si vous �tes l'un des n�tres, vous devez porter notre tenue. Allez d'abord vous changer.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Si quelqu'un vous remet l'armure du roi, vous avez tout int�r�t � la porter.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Si vous r�cusez la robe, vous r�cusez Innos. Partez maintenant, et m�ditez cela.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Si vous n'avez pas de quoi vous payer une armure, quel int�r�t ai-je � vous parler ?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Fumier de bandit !
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Fumier de pirate !
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(vous interpelle) Attendez !
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_11_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_11_Weather"						;//Quel sale temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Je vous ai enfin mis la main dessus !
	DieEnemy					=	"SVM_11_DieEnemy"					;//Vous allez en prendre pour votre grade !
	DieMonster					=	"SVM_11_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_11_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_11_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_11_SheepKiller"					;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_11_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Attendez un peu saloperie !
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Alors je vais devoir vous DEGAGER de l� !
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Alors quel �tait VOTRE r�le dans tout �a, hein ?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Allez vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Tant pis pour toi, vermine !
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_11_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//A l'avenir, �vitez de vous occuper de ce qui ne vous concerne pas !
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_11_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Laissez-moi juste tranquille !
	RunAway						= 	"SVM_11_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALERTE !
	Guards						=	"SVM_11_Guards"						;//A LA GARDE !
	Help						=	"SVM_11_Help"						;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(exclamation) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_11_GoodKill"					;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(injonction) Restez o� vous �tes, vermine !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Ouais, faites-vous oublier !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(en se r�veillant) Merde, qu'y a-t-il ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//De l'or ! Je me sers en premier...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Vous n'avez m�me pas une pi�ce d'or sur vous ?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Je pense que je vais garder votre arme � l'abri.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(avertissement) H� ! Attention !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(agressif) Vous n'en avez pas encore assez ?
	StopMagic					=	"SVM_11_StopMagic"					;//Eloignez-vous de moi avec votre magie !
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Arr�tez avec votre magie ! Vous �tes sourd ou quoi ?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Vous �tes sourd ou quoi ? J'ai dit : Posez cette arme !
	WiseMove					=	"SVM_11_WiseMove"					;//Vous voyez, ce n'�tait pas si difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(� lui-m�me) On verra �a...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(impatient) Passons � l'action.
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(constern�) Ils se fracassent la t�te...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(rire malfaisant) Il le m�ritait !
	NotBad						= 	"SVM_11_NotBad"						;//(d'un ton approbateur) Pas mal du tout...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(� lui-m�me) Quelle brute...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Voil� ce qu'il nous faut !
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Qu'est-ce que vous attendez ?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//Vas-y mon gars !
	Ooh01						=	"SVM_11_Ooh01"						;//Merdez pas !
	Ooh02						=	"SVM_11_Ooh02"						;//Montrez-lui qui est le patron !
	Ooh03						=	"SVM_11_Ooh03"						;//Oh ! Merde !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Sortez de mon lit !
	Awake						= "SVM_11_Awake"							;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//J'ai entendu dire que vous aviez r�gl� le probl�me avec le commandant.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//J'ai entendu dire que vous vous �tiez confess� aupr�s du p�re Parlan.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Ils ont dit que vous aviez r�gl� cette affaire avec Lee.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Massacrer nos moutons comme �a ! Boucher !
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Je ne parle pas aux brutes crasseuses !
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Hors de ma vue, sale voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Vous �tes une honte pour notre ordre ! Le seigneur Hagen sera furieux !
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Vous �tes une honte pour la garde de la ville ! Le seigneur Andr� vous apprendra les bonnes mani�res !
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Le seigneur Andr� saura ce que vous avait fait !
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Le p�re Parlan ne sera pas content d'entendre �a !
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee va vous donner ce que vous m�ritez ! Vous verrez bien o� cela va vous mener !
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Le commandant Garond exigera que vous vous expliquiez !
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Tr�s bien, tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(D'un ton suffisant) Dois-je encore vous montrer qui est le patron ?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Vous essayez encore de me provoquer, n'est-ce pas ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 pi�ces d'or.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 pi�ces d'or.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 pi�ces d'or.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 pi�ces d'or.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 pi�ces d'or.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 pi�ces d'or.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 pi�ces d'or.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 pi�ces d'or.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 pi�ces d'or.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 pi�ces d'or.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 pi�ces d'or.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 pi�ces d'or.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 pi�ces d'or.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 pi�ces d'or.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 pi�ces d'or.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 pi�ces d'or.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 pi�ces d'or.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 pi�ces d'or.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 pi�ces d'or.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 pi�ces d'or.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 pi�ces d'or.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 pi�ces d'or.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 pi�ces d'or.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 pi�ces d'or.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 pi�ces d'or.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 pi�ces d'or.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 pi�ces d'or.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//... pensez-vous vraiment que...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//... tout est possible...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//... il aurait d� le savoir...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//... comme si je n'avais pas assez de probl�mes...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//... qui vous a dit que...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//... cela ne fera que provoquer plus d'ennuis...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//... il y a eu tout un tas de rumeurs...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//... je n'aurais pas fait �a...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//... ce ne sont que des rumeurs...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//... il serait sage de faire attention � qui vous en parlez...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//... j'aurais pu vous le dire...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//... personne ne me demande mon avis...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//... on ne peut que se sentir d�sol� pour ce pauvre type...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//... �a n'a rien de nouveau...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//... c'est absolument �vident...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//... vous n'avez pas � me le demander...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//... vous savez d�j� ce que j'en pense...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//... c'est exactement ce que j'ai dit...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//... et �a ne risque pas de changer...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//... pourquoi n'en ai-je jamais entendu parler...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//... attendons et voyons ce qui va se passer...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//... certains probl�mes se r�solvent d�eux-m�mes...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//... je ne veux plus entendre �a...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//... il �tait ivre mort...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//... je refuse d'�tre trait� comme �a...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//... ils ont tous d�tal� comme des lapins, je me suis retrouv� tout seul...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//... ainsi est-il dit dans les saintes �critures...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//... j'agis toujours au nom d'Innos...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//... personne ne doit violer l'ordre divin...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_11_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_11_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_11_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_11_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_11_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Qu'est-ce que c'est que cette tenue ? �a ne vous va pas du tout. Laissez-moi tranquille.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Veuillez porter votre armure pour que je vous adresse la parole. Maintenant, fichez le camp.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Vous �tes tenu de porter l'armure du roi. Maintenant, rompez !
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Votre tenue ne sied pas � la grandeur de notre ordre. Allez vous changer.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Vous n'avez m�me pas d'armure... Fichez le camp !

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Encore un bandit.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//DES PIRATES !
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_12_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_12_Weather"					;//Putain de temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Je vous tiens !
	DieEnemy					=	"SVM_12_DieEnemy"					;//Vous n'auriez jamais d� venir ici !
	DieMonster					=	"SVM_12_DieMonster"					;//Venez l�, esp�ce de sale b�tard !
	DirtyThief					=	"SVM_12_DirtyThief"					;//Sale voleur ! Attendez un peu !
	HandsOff					=	"SVM_12_HandsOff"					;//�tez vos sales pattes de �a !
	SheepKiller					=	"SVM_12_SheepKiller"				;//Laissez nos moutons tranquilles !
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Eloignez-vous de nos moutons, sale chien !
	YouMurderer					=	"SVM_12_YouMurderer"				;//Assassin !
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Vous le regretterez !
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Je vous avais pr�venu !
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//J'ai dit DEHORS !
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Eh ! Que faisiez-vous ici ?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Arr�tez ! A l'instant !
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Je vais vous embrocher, b�tard !
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//C'en est fait de vous...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//J'aime bien �a !
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//Un monstre de moins sur ces terres !
	ThiefDown					=	"SVM_12_ThiefDown"					;//Je vous avertis ! Ne refaites plus jamais �a, sale voleur !
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//Et � partir de maintenant ne vous approchez plus de nos moutons !
	KillMurderer				=	"SVM_12_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Quelle cr�ature stupide !
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//N'essayez m�me plus de vous en prendre encore � moi !
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Je vous avais pr�venu !
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//Et maintenant, hors d'ici !
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Je ne veux plus jamais vous voir ici, compris ?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//N'oubliez pas qu'aucun combat n'est tol�r� ici !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Ne faites rien de stupide !
	RunAway						= 	"SVM_12_RunAway"						;//Je d�gage d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALERTE !
	Guards						=	"SVM_12_Guards"					;//A LA GARDE !
	Help						=	"SVM_12_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(exclamation) Envoyez ces b�tes ad patres !
	GoodKill					= 	"SVM_12_GoodKill"				;//(en criant) Ouais, faites-lui voir � ce b�tard !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(en hurlant) Je vous aurai !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Vous n'avez rien � faire ici !
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Ouais, sortez d'ici !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Qu�est-ce que vous mijotez ? Qu'est-ce que vous faites � fouiner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(en se r�veillant) Quoi, qu'est-ce que vous voulez ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Bon, au moins vous avez un peu d'or sur vous.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//M�me pas un peu d'or ? Pfff.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Je crois que je vais prendre votre arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(avertissement) Ne faites plus jamais �a, mon gars !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(agressif) Encore une petite correction ?
	StopMagic					=	"SVM_12_StopMagic"				;//Arr�tez avec cette magie !
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Dernier avertissement ! Arr�tez avec cette magie !
	WeaponDown					=	"SVM_12_WeaponDown"				;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Rangez �a ou vous allez y avoir droit !
	WiseMove					=	"SVM_12_WiseMove"				;//Eh ! Vous n'�tes pas aussi stupide que vous en avez l'air !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(� lui-m�me) Ne refaites plus jamais �a...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(� lui-m�me) Oh ! Ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(avide) Et maintenant on va rigoler...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(constern�) Oh la vache...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(rire malfaisant) Que cela lui serve de le�on...
	NotBad						= 	"SVM_12_NotBad"					;//(approbateur) En plein dans le mille !
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(� lui-m�me) Quelle sale brute !
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Tapez-lui dessus !
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Ne vous arr�tez pas !
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_12_Ooh01"					;//Faites attention !
	Ooh02						=	"SVM_12_Ooh02"					;//Eh bien, parez !
	Ooh03						=	"SVM_12_Ooh03"					;//Merde, �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_12_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Ainsi le commandant vous a arrang� le coup.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Ainsi, le p�re Parlan vous a absout de vos fautes ?
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Ainsi vous avez vu Lee et vous avez r�gl� cette affaire.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Bien.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Vous vous en prenez aux moutons ? Vous n'avez pas trouv� de victimes plus inoffensives ?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Je n'ai rien � faire avec des voyous !
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Je n'ai rien � faire avec des voleurs !
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//Alors vous voulez devenir paladin ? Attendez de savoir ce qu'en pense le seigneur Hagen !
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Vous appartenez vraiment � la garde de la ville ? Je doute que le seigneur Andr� tol�re �a !
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Allez voir le seigneur Hagen tant que vous le pouvez.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Allez voir le p�re Parlan. Il vous aidera � expier vos p�ch�s !
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee va en �tre inform� et vous devrez payer.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Cela ne va pas faire rire le commandant Garond. Vous feriez mieux d'aller lui parler avant que les choses n'empirent !
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(Sur un ton hautain) Je crois que maintenant vous savez � qui vous avez � faire. Que voulez-vous ?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//Encore vous ? Vous voulez encore vous battre avec moi ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 pi�ces d'or.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//... je m'en fiche �perdument...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//... personne ne veut savoir...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//... c'�tait son choix, n'est-ce pas...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//... aucune id�e, dites-moi...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//... je ne veux pas m'en m�ler...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//... je n'ai pas le temps de m'occuper de ce genre de choses...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//... je n'aurais pas pu m'en tirer...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//... vous n'avez pas � me dire �a...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//... allez ici, faites cela...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//... toutes les choses que je pourrais vous dire...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//... vous ne pouvez pas vous fier � �a...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//... c'est ce que j'avais l'habitude de dire...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//... et ce n'est pas termin�, croyez-moi...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//... toujours la m�me chose encore et encore...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//... dites-moi que ce n'est pas vrai...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//... cela devait arriver t�t ou tard...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//... il aurait vraiment d� r�fl�chir un peu plus...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//... �a ne changera jamais...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//... ce n'est pas un secret...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//... �a n'avait rien d'extraordinaire...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//... il pense que c'est aussi simple que �a...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//... personne ne souhaite entendre �a ...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//... et c'est la v�rit�...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//�vous devez juste �couter...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//... s'il n'avait tenu qu'� nous, les choses auraient pu tourner diff�remment...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//... il a simplement besoin de s'entra�ner davantage...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//... que sait-il du devoir...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//... Innos inflige de justes sanctions...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//... la voie de la vertu est difficile et sem�e d�emb�ches...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//... seul Innos peut appr�cier ce qui est bien ou mal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_12_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_12_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_12_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_12_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_12_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Votre tenue ne vous va pas du tout. Allez d'abord vous changer.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Portez votre armure si vous voulez vous adresser � moi.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Un soldat se doit de porter l'armure du roi. Aucune autre tenue n'est tol�r�e ! Allez vous changer, maintenant.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Votre tenue ne sied pas � la grandeur de notre ordre. Allez vous changer.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Vous n'avez m�me pas de quoi vous payer une armure. Je ne parle pas � la vermine de votre esp�ce.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Je te mettrai en pi�ces, bandit !
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Je te mettrai en pi�ces, pirate !
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_13_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_13_Weather"					;//Quel sale temps !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//J'aurai ta peau !
	DieEnemy					=	"SVM_13_DieEnemy"					;//Je vais vous mettre en pi�ces !
	DieMonster					=	"SVM_13_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_13_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_13_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_13_SheepKiller"				;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_13_YouMurderer"				;//Assassin !
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Attendez un peu, saloperie !
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Vous ne voulez pas partir ? Tr�s bien !
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Qu'est-ce que vous cherchez ?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Allez vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Tu l'as m�rit�, vermine !
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_13_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//A partir de maintenant, ne touchez plus � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_13_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Ne me faites pas de mal !
	RunAway						= 	"SVM_13_RunAway"					;//Oh ! Merde !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALERTE !
	Guards						=	"SVM_13_Guards"					;//A LA GARDE !
	Help						=	"SVM_13_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(exclamation) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_13_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(en criant) Oui ! Courez aussi vite que vous le pouvez !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Ouais, �loignez-vous de moi !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(en se r�veillant) Merde, qu'y a-t-il ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//N'en avez-vous pas encore assez ?
	StopMagic					=	"SVM_13_StopMagic"				;//Arr�tez avec ces conneries magiques !
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez �a tout de suite !!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_13_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(� lui-m�me) Bon, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(impatient) Ah ! Un combat !
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(constern�) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_13_GoodVictory"			;//(rire mal�fique) Vous lui avez montr� qui �tait le patron !
	NotBad						= 	"SVM_13_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(� lui-m�me) Mon Dieu ! Quelle brutalit�...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Allez !
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Faites-lui voir ce que vous valez !
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Montrez-lui !
	Ooh01						=	"SVM_13_Ooh01"					;//Attendez !
	Ooh02						=	"SVM_13_Ooh02"					;//Faites attention !
	Ooh03						=	"SVM_13_Ooh03"					;//Ouah ! En plein dans le mille !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_13_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Ainsi vous avez r�gl� le probl�me avec le commandant.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Ainsi, le p�re Parlan vous a absout ?
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Ainsi vous avez r�gl� le probl�me avec Lee.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Massacrer nos moutons de la sorte !
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Laissez-moi tranquille, sale brute !
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Laissez-moi tranquille, mis�rable voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Vous �tes une honte pour notre ordre ! Attendez que le seigneur Hagen en entende parler !
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Vous �tes une honte pour la garde de la ville ! Attendez que le seigneur Andr� en entende parler !
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Attendez que le seigneur Andr� entende parler de �a !
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Attendez que le p�re Parlan entende parler de �a !
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Attendez que Lee ait vent de cette affaire...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Attendez que le commandant Garond entende parler de �a !
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Tr�s bien, tr�s bien, vous �tes le meilleur combattant. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(avec suffisance) Je pr�sume que vous savez maintenant qui de nous deux est le plus fort... Que voulez-vous ?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Je croyais que vous vouliez me provoquer. Vous avez chang� d'avis ? Vous pr�f�rez PARLER ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 pi�ces d'or.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//... je m'en fiche �perdument...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//... personne ne veut savoir...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//... c'�tait son choix, n'est-ce pas...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//... aucune id�e, dites-moi...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//... je ne veux pas m'en m�ler...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//... je n'ai pas le temps de m'occuper de ce genre de choses...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//... je n'aurais pas pu m'en tirer...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//... vous n'avez pas � me dire �a...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//... allez ici, faites cela...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//... toutes les choses que je pourrais vous dire...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//... vous ne pouvez pas vous fier � �a...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//... c'est ce que j'avais l'habitude de dire...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//... et ce n'est pas termin�, croyez-moi...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//... toujours la m�me chose encore et encore...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//... dites-moi que ce n'est pas vrai...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//... cela devait arriver t�t ou tard...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//... il aurait d� r�fl�chir...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//... �a ne changera jamais...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//... ce n'est pas un secret...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//... �a n'avait rien d'extraordinaire...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//... il pense que c'est aussi simple que �a...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//... personne ne souhaite entendre �a ...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//... et c'est la v�rit�...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//�vous devez juste �couter...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//... s'il n'avait tenu qu'� nous, les choses auraient pu tourner diff�remment...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//... il a simplement besoin de s'entra�ner davantage...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//... que sait-il du devoir...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//... Innos inflige de justes sanctions...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//... la voie de la vertu est difficile et sem�e d�emb�ches...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//... seul Innos peut appr�cier ce qui est bien ou mal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_13_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_13_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_13_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_13_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_13_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Qu'est-ce que c'est que cette tenue ? �a ne vous va pas du tout. Laissez-moi tranquille.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Vous ne portez pas votre armure. Allez la chercher imm�diatement.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Vous devriez arborer l'armure du roi avec fiert�, plut�t que porter ces oripeaux. Hors de ma vue !
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Pourquoi ne portez-vous pas la tenue de notre grand ordre ? Allez vous changer, et m�ditez mes propos.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Vous n'avez m�me pas d'armure... Fichez le camp !

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Salet� de bandit !
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Mis�rable pirate !
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_14_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_14_Weather"						;//Quel temps d�gueulasse !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//Je vous ai enfin mis la main dessus !
	DieEnemy					=	"SVM_14_DieEnemy"					;//Vous allez en prendre pour votre grade !
	DieMonster					=	"SVM_14_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_14_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_14_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_14_SheepKiller"					;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_14_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Attendez un peu, saloperie !
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Alors je vais devoir vous DEGAGER de l� !
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Alors quel �tait VOTRE r�le dans tout �a, hein ?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Allez vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//Tant pis pour toi, vermine !
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_14_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//A l'avenir, �vitez de vous occuper de ce qui ne vous concerne pas !
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_14_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Laissez-moi juste tranquille !
	RunAway						= 	"SVM_14_RunAway"						;//Merde ! Je me tire d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALERTE !
	Guards						=	"SVM_14_Guards"						;//A LA GARDE !
	Help						=	"SVM_14_Help"						;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(exclamation) Bien jou�, une sale b�te en moins !
	GoodKill					= 	"SVM_14_GoodKill"					;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(injonction) Restez o� vous �tes, vermine !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Ouais, faites-vous oublier !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(en se r�veillant) Merde, qu'y a-t-il ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//De l'or ! Je me sers en premier...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Vous n'avez m�me pas une pi�ce d'or sur vous ?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Je pense que je vais garder votre arme � l'abri.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(avertissement) H� ! Attention !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(agressif) Vous n'en avez pas encore assez ?
	StopMagic					=	"SVM_14_StopMagic"					;//Eloignez-vous de moi avec votre magie !
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Arr�tez votre magie ! Vous �tes sourd ou quoi ?
	WeaponDown					=	"SVM_14_WeaponDown"					;//Posez cette arme !
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Vous �tes bouch� ? J'ai dit : posez cette arme !
	WiseMove					=	"SVM_14_WiseMove"					;//Vous voyez, ce n'�tait pas si difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(� lui-m�me) Nous en reparlerons...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(� lui-m�me) Oh ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(tr�pidant) Passons � l'action.
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(constern�) Ils se fracassent la t�te...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(rire malfaisant) Il le m�ritait !
	NotBad						= 	"SVM_14_NotBad"						;//(d'un ton approbateur) Pas mal du tout...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(� lui-m�me) Quelle brute...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Voil� ce qu'il nous faut !
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Qu'est-ce que vous attendez ?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Vas-y mon gars !
	Ooh01						=	"SVM_14_Ooh01"						;//Merdez pas !
	Ooh02						=	"SVM_14_Ooh02"						;//Montrez-lui qui est le patron !
	Ooh03						=	"SVM_14_Ooh03"						;//Oh ! Merde !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Sortez de mon lit !
	Awake						= "SVM_14_Awake"							;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//J'ai entendu dire que vous aviez r�gl� le probl�me avec le commandant.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//J'ai entendu dire que vous vous �tiez confess� aupr�s du p�re Parlan.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Ils ont dit que vous aviez r�gl� cette affaire avec Lee.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//C'est bien.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Massacrer nos moutons comme �a ! Boucher !
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Je ne parle pas aux brutes crasseuses !
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Hors de ma vue, sale voleur !
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Vous �tes une honte pour notre ordre ! Le seigneur Hagen sera furieux !
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Vous �tes une honte pour la garde de la ville ! Le seigneur Andr� vous apprendra les bonnes mani�res !
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Le seigneur Andr� saura ce que vous avait fait !
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Le p�re Parlan ne sera pas content d'entendre �a !
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Lee va vous donner ce que vous m�ritez ! Vous verrez bien o� cela va vous mener !
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Le commandant Garond exigera que vous vous expliquiez !
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Tr�s bien, tr�s bien, vous avez gagn�. Que voulez-vous ?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(D'un ton suffisant) Dois-je encore vous montrer qui est le patron ?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Vous essayez encore de me provoquer ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 pi�ces d'or.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 pi�ces d'or.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 pi�ces d'or.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 pi�ces d'or.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 pi�ces d'or.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 pi�ces d'or.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 pi�ces d'or.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 pi�ces d'or.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 pi�ces d'or.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 pi�ces d'or.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 pi�ces d'or.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 pi�ces d'or.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 pi�ces d'or.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 pi�ces d'or.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 pi�ces d'or.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 pi�ces d'or.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 pi�ces d'or.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 pi�ces d'or.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 pi�ces d'or.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 pi�ces d'or.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 pi�ces d'or.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 pi�ces d'or.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 pi�ces d'or.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 pi�ces d'or.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 pi�ces d'or.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 pi�ces d'or.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 pi�ces d'or.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//... je n'arrive pas � y croire...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//... je n'en serais pas aussi certain...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//... mais il l'a toujours su...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//... je ne sais plus que croire...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//... je ne sais pas pourquoi il �tait aussi �nerv�...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//... j'ai assez d�ennuis comme �a...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//... j'avais entendu parler d'une ou deux choses...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//... je ne touche pas � �a...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//... Vous ne devriez pas croire tout ce que vous entendez...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//... ce n'est pas de moi qu'il le tient...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//... c'est ce que j'ai toujours pens�...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//... personne ne me demande jamais mon avis...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//... il ne m�ritait vraiment pas �a...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//... ne dites pas que vous ne saviez pas...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//... c'�tait l'�vidence m�me...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//... d'o� tenez-vous �a...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//... cela ne peut pas continuer comme �a �ternellement...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//... j'ai mon propre avis sur le sujet...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//... c'�tait exactement comme vous l'aviez dit...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//... je ne crois pas que cela changera...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//... c'est la premi�re fois que j'en entends parler...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//� il ne nous reste plus qu'� attendre...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//... je savais que cela poserait un probl�me...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//... alors pourquoi refusent-ils de m'�couter...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//... il courait comme si B�liar en personne �tait � ses trousses...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//... bien entendu, nous avons fini par l'avoir...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//... vous devez prendre le taureau par les cornes et arranger les choses...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//... il y en a qui ne se rendent m�me pas compte de leur vilenie...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//... car telle est la volont� d'Innos...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//... ses exploits n'�taient que...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_14_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_14_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_14_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_14_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_14_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Votre tenue ne vous va pas du tout. Vous devez avoir quelque chose � cacher. Laissez-moi tranquille !
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Si vous voulez vous adresser � moi, vous devez porter votre armure.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Soyez fier de l'arm�e ! Vous n'avez pas � porter ces haillons. D'abord, allez vous changer !
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Votre tenue ne sied pas � la grandeur de notre ordre. Allez vous changer.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Vous n'avez m�me pas d'armure... Fichez le camp !

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Meurs, bandit !
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Meurs, pirate !
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Eh ! Vous !
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//Eh ! Vous !
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//H� !
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//H� !
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Attendez une minute !

	DoesntWork				= 	"SVM_15_DoesntWork"					;//�a marche pas.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hum, �a a cass�.
	NeedKey					= 	"SVM_15_NeedKey"					;//J'ai besoin de la clef pour �a...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Plus d'outils de crochetage...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Je n'y connais rien en crochetage.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Balayer toutes les chambres va prendre une �ternit� !
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hum... Je n'ai ni clef ni outil de crochetage.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Jamais je ne r�ussirai � ouvrir �a sans la bonne clef !
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//J�aurais bien besoin de quelques outils de crochetage.
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Jamais je n'arriverai � ouvrir cette chose !
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Qu'est-ce qui me manque ?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hum... Non...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Rien � r�cup�rer
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Rien ici...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Rien � piller...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaaargh !
	Awake					=	"SVM_15_Awake"						;//(R�veil)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Hum. C'est donc ici que vous vous cachez. �a fait une sacr�e trotte. J'aurai besoin d'un navire pour y aller.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innos, accorde-moi Ton aide et purifie ce sanctuaire.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innos, accorde-moi Ton aide et tout �a... Voil�. �a devrait �tre la derni�re fois.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO ! Ah ! Le livre s'ouvre. Il y a une lettre et une clef � l'int�rieur..
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR ! Ouvre-toi !

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Faisons affaires.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Montrez-moi vos marchandises.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Montrez-moi ce que vous avez.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Je vois.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ah... je crois avoir trouv� quelque chose.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Je ne comprends pas...
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Je n'arrive pas � lire cela !
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR !
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA !
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS !
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(tousse) Oh, bon sang. Brrr !!!
	HUI						=	"SVM_15_Addon_HUI"						;//Oh oh oh !
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Que savez-vous de la tentative d'assassinat d'Esteban ?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//A propos de l'attaque lanc�e contre Esteban...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Je veux tuer ces tra�tres.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Je recherche ces types pour pouvoir abattre Esteban.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//On a besoin de vous dans la mine.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Apparais devant moi, Quarhodron, ancien commandant de la caste des guerriers !
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Hmm... �a ne marche pas ici.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Pourquoi dois-je apprendre � extraire de l'or ?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Aha... le livre des paies de Francis. Ce type semble avoir d�tourn� un sacr� paquet d'or pour sa petite retraite...
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR !

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_16_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_16_Weather"						;//Quel temps d�gueulasse !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//Je vous ai enfin mis la main dessus !
	DieEnemy					=	"SVM_16_DieEnemy"					;//Vous allez en prendre pour votre grade !
	DieMonster					=	"SVM_16_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_16_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_16_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_16_SheepKiller"					;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_16_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Attendez un peu saloperie !
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Alors je vais devoir vous DEGAGER de l� !
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Alors quel �tait VOTRE r�le dans tout �a, hein ?
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Allez vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//Tant pis pour toi, vermine !
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_16_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//A partir de maintenant, ne touchez pas � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_16_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Ne me faites pas de mal !
	RunAway						= 	"SVM_16_RunAway"						;//Je d�gage d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALERTE !
	Guards						=	"SVM_16_Guards"					;//A LA GARDE !
	Help						=	"SVM_16_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(exclamation) Bien jou� !
	GoodKill					= 	"SVM_16_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(en criant fort) Restez o� vous �tes, l�che !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Ouais, faites-vous oublier !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(en se r�veillant) Quel est le probl�me ?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//N'en avez-vous pas encore assez ?
	StopMagic					=	"SVM_16_StopMagic"				;//Arr�tez avec ces conneries magiques !
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez imm�diatement !!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_16_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(� elle-m�me) Mouais, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(� elle-m�me) Oh ! Ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(impatiente) Aah! Un combat !
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(constern�e) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_16_GoodVictory"			;//(rire mal�fique) Vous lui avez montr� qui �tait le patron !
	NotBad						= 	"SVM_16_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(� elle-m�me) Seigneur ! Quelle brutalit�...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Massacrez-le !
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Donnez-lui ce qu'il m�rite !
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_16_Ooh01"					;//Ripostez !
	Ooh02						=	"SVM_16_Ooh02"					;//Alors, faites gaffe !
	Ooh03						=	"SVM_16_Ooh03"					;//Oh ! �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_16_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Ainsi vous �tes all� voir le commandant et vous avez lav� votre honneur ?
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Ainsi le p�re Parlan vous a absout pour vos p�ch�s ?
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee vous a arrang� le coup.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//C'est bien.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Vous ne pouvez pas tuer nos moutons comme �a ! Allez-vous-en !
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Vous n'�tes qu'une brute, je ne veux rien avoir � faire avec vous.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Je ne parle pas aux voleurs. Et maintenant, allez-vous-en !
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Votre attitude n'est pas honorable. Le seigneur Hagen n'aimera pas �a !
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Votre comportement est une honte pour la garde de la ville ! Le seigneur Andr� exigera des explications !
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Le seigneur Andr� apprendra ce que vous avait fait !
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Vous vous �tes mal conduit. Allez voir le p�re Parlan pour vous repentir.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee d�couvrira ce que vous avez fait et il vous punira !
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Le commandant Garond exigera que vous vous expliquiez !
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 pi�ces d'or.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//... vraiment ? Comme c'est int�ressant...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//... je n'y crois pas...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//... ce n'est pas ce que pense mon mari...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//... allez-vous-en, ne me dites pas �a...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//... honn�tement, je l'ai vu de mes yeux vu...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//... ne le dites pas...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//... ne le dites � personne...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//... les temps sont durs...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//... qui ose dire de telles choses ?...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//... si je ne l'avais pas vu de mes propres yeux...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//... quelqu'un doit bien faire le travail...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//... ce n'est pas ce que j'ai entendu dire...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//... c'est tellement commun, n'est-ce pas...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//... il ne peut rien garder pour lui...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//... il aurait mieux fait de se taire...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//... et il travaille toute la journ�e �galement...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//... je ne peux pas m'occuper de tout pour tout le monde...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//... il parle tout simplement trop...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//... ce n'est pas un bien grand secret...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//... tout le monde est au courant maintenant...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//... je ne lui dirai jamais plus rien...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//... et cela va empirer...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//... mais c'est horrible...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//... c'est ce que j'ai toujours dit...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_16_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_16_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_16_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_16_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_16_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaaaargh !
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Allez passer une tenue d�cente. Je ne veux pas vous voir habill� de la sorte.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//UN BANDIT !
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//UN PIRATE !
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Pour le roi !
	PALGreetings				=	"SVM_17_PALGreetings"				;//Pour Innos !
	Weather						= 	"SVM_17_Weather"						;//Quel temps d�gueulasse !
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//Je vous ai enfin mis la main dessus !
	DieEnemy					=	"SVM_17_DieEnemy"					;//Vous allez en prendre pour votre grade !
	DieMonster					=	"SVM_17_DieMonster"					;//Il y a une autre de ces immondes bestioles !
	DirtyThief					=	"SVM_17_DirtyThief"					;//Sale voleur ! Attends un peu !
	HandsOff					=	"SVM_17_HandsOff"					;//�tez vos sales pattes de l� !
	SheepKiller					=	"SVM_17_SheepKiller"					;//Cette salet� massacre nos moutons !
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Ce foutu monstre d�vore nos moutons !
	YouMurderer					=	"SVM_17_YouMurderer"					;//Assassin !
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Pas de b�tes ici !
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Attendez un peu, saloperie !
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Vous l'avez cherch� !
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Alors je vais devoir vous DEGAGER de l� !
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Alors quel �tait VOTRE r�le dans tout �a, hein ?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Allez vous arr�ter ?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Meurs, b�tard !
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//Tant pis pour toi, vermine !
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Un monstre de moins !
	ThiefDown					=	"SVM_17_ThiefDown"					;//N'essayez jamais plus de me voler !
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//A partir de maintenant, ne touchez pas � ce qui ne vous appartient pas !
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Ne refaites plus jamais �a ! Ce sont nos moutons !
	KillMurderer				=	"SVM_17_KillMurderer"				;//Meurs, assassin !
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//Quelle b�te stupide !
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Ne me provoquez plus jamais !
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Vous auriez d� m'�couter !
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//Et maintenant sortez d'ici !
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//Et que je ne vous revoie plus jamais ici !
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Pas de combat ici, compris ? Que cela vous serve de le�on !
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Ne me faites pas de mal !
	RunAway						= 	"SVM_17_RunAway"						;//Je d�gage d'ici !
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALERTE !
	Guards						=	"SVM_17_Guards"					;//A LA GARDE !
	Help						=	"SVM_17_Help"					;//Au secours !
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(exclamation) Bien jou� !
	GoodKill					= 	"SVM_17_GoodKill"				;//(exclamation) Ouais, donnez � ce porc ce qu'il m�rite !
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Laissez-moi tranquille !
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(en criant fort) Restez o� vous �tes, l�che !
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Sortez d'ici !
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Qu'est-ce que vous voulez ! Partez !
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Ouais, faites-vous oublier !
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//H� ! Vous ! Qu�est-ce que vous faites � tra�ner dans le coin ?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(en se r�veillant) Qu'esse qu'y'a?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Merci pour l'or, le h�ros !
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Pauvre minable, t'as m�me pas une pi�ce d'or sur toi ?
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Je crois que je ferais bien de prendre cette arme.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(avertissement) Attention ! Refaites �a et je vous tape dessus !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//N'en avez-vous pas encore assez ?
	StopMagic					=	"SVM_17_StopMagic"				;//Arr�tez avec ces conneries magiques !
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Vous voulez une racl�e ? Arr�tez imm�diatement !!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Rangez cette arme !
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Allez-vous ranger cette foutue arme ?!
	WiseMove					=	"SVM_17_WiseMove"				;//Brave gar�on !
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(� elle-m�me) Mouais, on verra �a la prochaine fois...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(� elle-m�me) Oh ! Ma t�te...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(impatiente) Aah! Un combat !
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(constern�e) Oh ! Mon Dieu ! Un combat !
	GoodVictory					=	"SVM_17_GoodVictory"			;//(rire mal�fique) Vous lui avez montr� qui �tait le patron !
	NotBad						= 	"SVM_17_NotBad"					;//(d'un ton approbateur) Pas mal...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(� elle-m�me) Seigneur ! Quelle brutalit�...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Massacrez-le !
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Donnez-lui ce qu'il m�rite !
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Achevez-le !
	Ooh01						=	"SVM_17_Ooh01"					;//Ripostez !
	Ooh02						=	"SVM_17_Ooh02"					;//Alors, faites gaffe !
	Ooh03						=	"SVM_17_Ooh03"					;//Oh ! �a fait mal !
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(en se r�veillant) Qu'est-ce que c'�tait que �a ?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Sortez de mon lit !
	Awake						= "SVM_17_Awake"					;//(b�illement bruyant)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Ainsi vous �tes all� voir le commandant et vous avez lav� votre honneur ?
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Ainsi le p�re Parlan vous a absout pour vos p�ch�s ?
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee vous a arrang� le coup.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//C'est bien.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Vous ne pouvez pas tuer nos moutons comme �a ! Allez-vous-en !
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Vous n'�tes qu'une brute, je ne veux rien avoir � faire avec vous.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Je ne parle pas aux voleurs et maintenant allez-vous-en !
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Votre attitude n'est pas honorable. Le seigneur Hagen n'aimera pas �a !
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Votre comportement est une honte pour la garde de la ville ! Le seigneur Andr� exigera des explications !
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Le seigneur Andr� apprendra ce que vous avait fait !
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Vous vous �tes mal conduit. Allez voir le p�re Parlan pour vous repentir.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee d�couvrira ce que vous avez fait et il vous punira !
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Le commandant Garond exigera que vous vous expliquiez !
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 pi�ces d'or.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 pi�ces d'or.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 pi�ces d'or.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 pi�ces d'or.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 pi�ces d'or.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 pi�ces d'or.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 pi�ces d'or.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 pi�ces d'or.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 pi�ces d'or.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 pi�ces d'or.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 pi�ces d'or.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 pi�ces d'or.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 pi�ces d'or.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 pi�ces d'or.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 pi�ces d'or.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 pi�ces d'or.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 pi�ces d'or.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 pi�ces d'or.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 pi�ces d'or.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 pi�ces d'or.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 pi�ces d'or.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 pi�ces d'or.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 pi�ces d'or.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 pi�ces d'or.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 pi�ces d'or.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 pi�ces d'or.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 pi�ces d'or.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 pi�ces d'or.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//... vraiment ? Comme c'est int�ressant...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//... je n'y crois pas...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//... ce n'est pas ce que pense mon mari...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//... allez-vous-en, ne me dites pas �a...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//... honn�tement, je l'ai vu de mes yeux vu...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//... ne le dites pas...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//... ne le dites � personne...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//... les temps sont durs...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//... qui ose dire de telles choses ?...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//... si je ne l'avais pas vu de mes propres yeux...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//... quelqu'un doit bien faire le travail...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//... ce n'est pas ce que j'ai entendu dire...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//... c'est tellement commun, n'est-ce pas...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//... il ne peut rien garder pour lui...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//... il aurait mieux fait de se taire...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//... et il travaille toute la journ�e �galement...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//... je ne peux pas m'occuper de tout pour tout le monde...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//... il parle tout simplement trop...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//... ce n'est pas un bien grand secret...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//... tout le monde est au courant maintenant...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//... je ne lui dirai jamais plus rien...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//... et cela va empirer...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//... mais c'est horrible...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//... c'est ce que j'ai toujours dit...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Revenez quand vous serez plus exp�riment�.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Vous m'en demandez plus que je ne peux vous en apprendre.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Je ne peux rien vous apprendre d'autre. Vous �tes trop bon.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Vous voyez, vous avez d�j� fait des progr�s...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Vous �tes dans le bas quartier de la ville.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Vous �tes dans le haut quartier de la ville.
	TEMPEL						= "SVM_17_TEMPEL"					;//Vous �tes au temple.
	MARKT						= "SVM_17_MARKT"						;//Vous �tes sur la place du march�.
	GALGEN						= "SVM_17_GALGEN"					;//Vous �tes d�sormais sur la place de la potence devant la caserne.
	KASERNE						= "SVM_17_KASERNE"					;//C'est la caserne.
	HAFEN						= "SVM_17_HAFEN"						;//Vous �tes maintenant dans le quartier du port.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//O� voulez-vous aller ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Franchissez la porte de la cit� int�rieure et vous entrerez dans le bas quartier de la ville.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Des escaliers conduisent de la porte sud de la ville � la porte de la ville int�rieure. C'est l� que commence le haut quartier.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Emprunter le passage souterrain pr�s de la forge vous m�nera � la place du temple.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//En descendant la rue � partir de la forge, vous arriverez au port.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Il y a un passage souterrain qui m�ne de la place du temple au bas quartier.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Quand vous �tes devant le temple, passez � gauche et longez le mur de la ville. Cela vous conduira � la place du march�.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//En venant du temple, si vous laissez le pub sur votre gauche, vous arriverez � la place de la potence.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Suivre le mur de la ville � partir de la place du march� vous conduira au temple.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier en face de l'h�tel.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Passez devant la caserne et vous arriverez � la place de la potence.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Descendez l'avenue � partir de la place de la potence et vous arriverez � la place du temple.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Passez devant la caserne et vous arriverez � la place du march�.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Le grand b�timent, c'est la caserne. Empruntez l'escalier.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Descendez l'escalier � gauche de l'entr�e principale et vous arriverez � la place du march�.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Descendez l'escalier � droite de l'entr�e principale et vous arriverez � la place de la potence.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Remontez la route du port � partir du mur des quais et vous arriverez au bas quartier.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//Aaaaaargh !
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(sifflement) Voil� pour lui !
	RunCoward    	= "SVM_19_RunCoward"    	;//(sifflement) On vous aura !
	Dead      		= "SVM_19_Dead"      	;//Aaaaaargh !
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




