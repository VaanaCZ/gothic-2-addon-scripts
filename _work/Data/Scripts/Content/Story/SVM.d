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
	var string Awake;						//NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, rakeln)
	
	// ------ B_AssignAmbientNEWS ------
	var string ABS_COMMANDER;				//Ich horte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	var string ABS_MONASTERY;				//Ich horte, du warst bei Vater Parlan und hast Bu?e getan.
	var string ABS_FARM;					//Ich horte, du warst bei Lee und und hast die Sache wieder in Ordnung gebracht.
	var string ABS_GOOD;
	// ---------------------------------
	var string SHEEPKILLER_CRIME; 			//Einfach unsere Schafe zu schlachten! Mach, da? du hier wegkommst!
	var string ATTACK_CRIME;				//Mit miesen Schlagern rede ich nicht!
	var string THEFT_CRIME;					//Geh mir aus den Augen, dreckiger Dieb!
	var string MURDER_CRIME;				//Mit gemeinen Mordern rede ich nicht.
	// ---------------------------------
	var string PAL_CITY_CRIME; 				//Du bist eine Schande fur deinen Orden! Lord Hagen wird toben vor Wut!
	var string MIL_CITY_CRIME;				//Du bist eine Schande fur die Stadtwache! Lord Andre wird dir das sicher austreiben!
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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_1_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_1_Weather"						;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_1_DieEnemy"					;//������ �� ��������!
	DieMonster					=	"SVM_1_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_1_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_1_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_1_SheepKiller"					;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_1_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//������ � �������� ���� ������!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//��� ���� ����� ����, �?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//�������� ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//�������, �������?!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_1_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//� �����, ��� ������ ���� ��������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_1_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//� ������ �������� ������!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//������ ���� � �����!
	RunAway						= 	"SVM_1_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//�������!
	Guards						=	"SVM_1_Guards"						;//������!
	Help						=	"SVM_1_Help"						;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_1_GoodKill"					;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//�������� ����������, �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//�������� ������!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//��� ���� ����� �����?! �����!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//��, �������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//������! ��, ������ ������� �� ��������...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//� ����� ������� ��� �� ����� � ��������.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//�, �������, ������ ���� ������, ��� ����� ���������� ��� ���� ��.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//��! ���������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(����������) �� ���� �������?
	StopMagic					=	"SVM_1_StopMagic"					;//������� �������� �� ���� � ���� ������!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//����� ��� �����! �� ���, �����?!
	WeaponDown					=	"SVM_1_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//�� ���, �����? � ������: ����� ������!
	WiseMove					=	"SVM_1_WiseMove"					;//������, ��� ���� �� ��� �� ������.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(��������) ������ �����������!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(����������) ��� ����� ���� ����� ���, ��� ���� �������...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(����������� ����) �� �������� ���!
	NotBad						= 	"SVM_1_NotBad"						;//(������������) ������ �� �����...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(���� ��� ���) ����� �� ��������...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//��, ��� ��� ��, ��� �����!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//���� �� �����?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//��� ���!
	Ooh01						=	"SVM_1_Ooh01"						;//�� ������� �����!
	Ooh02						=	"SVM_1_Ooh02"						;//������ ���, ��� ��� �������!
	Ooh03						=	"SVM_1_Ooh03"						;//���� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//�������� � ���� �������!
	Awake						= "SVM_1_Awake"							;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//� ������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//�������, �� ��������� � �� � ��� ������.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//� �� ������������ � �������� ������!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//�����, � ���� ����, ������� ���!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//�� �������� ��� �����! ���� ����� ����� � ������!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//�� �������� ��������� ������! ���� ����� ������ ���� ������� �������!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//���� ����� ������ � ���, ��� �� ������!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//���� ������ �� ����� ���, ����� ������ �� ���� ���������!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//�� ������ ���� ������! �� ����� �������!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//����������� ������ ��������� �� ���� ����������!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//������, ������, �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//���� ��� ��� ��������, ��� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 ������� �����.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 ������� �����.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 ������� �����.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 ������� �����.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 ������� �����.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 ������� �����.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 ������� �����.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 ������� �����.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 ������� �����.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 ������� �����.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 ������� �����.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 ������� �����.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 ������� �����.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 ������� �����.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 ������� �����.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 ������� �����.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 ������� �����.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 ������� �����.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 ������� �����.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 ������� �����.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 ������� �����.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 ������� �����.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 ������� �����.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 ������� �����.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 ������� �����.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 ������� �����.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 ������� �����.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...�� ������������� �������...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...��� ��������...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...��� ������ ����� ��������...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...��� ����� � ���� ��� ���� ������� �� �������...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...��� ������ ���� ���...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...�� ����� ����� ���� ��������...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...����� ������ �����...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...�� ����� ����� � �� ����� �� �����...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...��� ��� �����...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...� �� �� ������� ����, ��� ���� ��� ������...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...��������, � ������� ���� ������...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...����� ������� �� ���������� ����...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...���� ������ ���� ���� ����� �������...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...��� ������ ������...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...��� ��������� ��������...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...���� �� ����� ���������� ���� �� ����...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...��� ����� ������������ ��������...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...�� ��� ������, ��� � �����...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...��� ������ ���, ��� � ������...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...����� �� ������� ���...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...� ������ � �� ������ �� ���� ������...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...���������, ��� ����� ������...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...��������� �������� �������� ���� �����...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...� ������ �� ���� ������� �� ����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...�� ������� � �������...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...� �� ������� ��� ���������� � �����...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...��� ��� ����������� ��� �����, � � ������� ������ ����...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...��� ��������� � �������...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...� ������ �������� ���, ��� ������� �����...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//...����� �� ����� �������� ������������ �������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_1_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_1_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_1_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_1_KASERNE"					;//��� �������.
	HAFEN						= "SVM_1_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//������!
	Aargh_1						= "SVM_1_Aargh_1"					;//������!
	Aargh_2						= "SVM_1_Aargh_2"					;//������!
	Aargh_3						= "SVM_1_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//��� �� ���� ������. � �� ���� � ����� �������������.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//��� �� ������? ������ ���-������ ���������.
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//�� ������! �� ��� �������� ��� ������.
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//���� ������ �� ������������� ������ ������. ����� � �����������.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//� ���� ��� ������� ��������. ��������!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//����, ������� ���������!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//��������� �����!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_3_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_3_Weather"					;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_3_DieEnemy"					;//� ������� ���� �� �����!
	DieMonster					=	"SVM_3_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_3_DirtyThief"					;//������� ���! ��, �������!
	HandsOff					=	"SVM_3_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_3_SheepKiller"				;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_3_YouMurderer"				;//������!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//�� �� ������ ����? ������!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//��� ���� ���� ����� ���?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//�� �������� ���, �������!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_3_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_3_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//� ������, �������� ������!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//�� ������ ����!
	RunAway						= 	"SVM_3_RunAway"					;//��, ����!!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//�������!
	Guards						=	"SVM_3_Guards"					;//������!
	Help						=	"SVM_3_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_3_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//��! ���� �� ���� ���!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//��� ���� ����� �����?! �����!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//��, �������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//�� �� �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//������! ��� ��� - � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//���� ��� ��� ����?
	StopMagic					=	"SVM_3_StopMagic"				;//�������� ��� ���������� ������!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//������ ��������? �������� ����������!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_3_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(��������) ���, �����!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(����������� ����) �� ������� ���, ��� ����� �������!
	NotBad						= 	"SVM_3_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//����� ���!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//����������, ��!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//������ ���!
	Ooh01						=	"SVM_3_Ooh01"					;//�������!
	Ooh02						=	"SVM_3_Ooh02"					;//���������!
	Ooh03						=	"SVM_3_Ooh03"					;//��! ����� ����!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_3_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//�������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//�������, �� ����� � �� � ��� ������.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//������ ���� � �����, ������� ��������!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//������ ���� � �����, ���������� �������!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//�� �������� ��� �����! �������, ���� ����� ������ �� ����!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//�� �������� ��������� ������! �������, ���� ����� ������ �� ����!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//�������, ���� ����� ������ �� ����.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//�������, ���� ������ ������ �� ����!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//�������, �� ������ �� ����...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//�������, ����������� ������ ������ �� ����!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//������, ������, �� ������ ����. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//� �����, ��� ������ �� ��������� ������, ��� �� ��� �������... ���� �� ������?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//� �����, �� ������ ��������� �� ����. �� ���������? �� ������������� �������, ��? (�������)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 ������� �����.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...�� ������������� �������...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...��� ��������...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...��� ������ ����� ��������...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...��� ����� � ���� ��� ����� ���� �������...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...��� ������ ���� ���...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...�� ����� ����� ���� ��������...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...����� ������ �����...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...������� �� �� �������...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...��� ��� �����...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...� �� �� ������� ����, ��� ������ ���� ���...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...��������, � ������� ���� ������...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...����� ������� �� ���������� ����...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...���� ������ ���� ���� ����� �������...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...��� ������ ������...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...��� ��������� ��������...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...���� �� ����� ���������� ���� �� ����...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...��� ����� ������������ ��������...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...�� ��� ������, ��� � �����...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...� ��� � ������...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...����� �� ������� ���...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...� ������ � �� ������ �� ���� ������...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...���������, ��� ����� ������...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...��������� �������� �������� ���� �����...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...� ������ �� ���� ������� �� ����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...�� ������� � �������...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...� �� ������� ��� ���������� � �����...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...��� ��� ����������� ��� �����, � � ������� ������ ����...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...��� ��������� � �������...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...� ������ �������� ���, ��� ������� �����...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...����� �� ����� �������� ������������ �������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_3_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_3_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_3_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_3_KASERNE"					;//��� �������.
	HAFEN						= "SVM_3_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//������!
	Aargh_1						= "SVM_3_Aargh_1"					;//������!
	Aargh_2						= "SVM_3_Aargh_2"					;//������!
	Aargh_3						= "SVM_3_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//��� ��� �� ������? ��� ���������� ���� �� ��������. ������ ���� � �����.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//���� �� ������, ����� � ����� ��������, ������� ��������.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//��, �������, ����� ���� ����� � ���������. �����, �����������.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//� ����� ������ ��� �����, ������� �� ����� ���������� �����. ����� � �����������!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//��, ������, ������ ����� �� ������. ��� ������ ������ ���-������ ���������.

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//������� ����, ���������!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//������� ����, �����!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_4_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_4_Weather"						;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//����� ��!
	DieEnemy					=	"SVM_4_DieEnemy"					;//� ������� ���� �� �����!
	DieMonster					=	"SVM_4_DieMonster"					;//��� ���� �����!
	DirtyThief					=	"SVM_4_DirtyThief"					;//�� �� ������ ���!
	HandsOff					=	"SVM_4_HandsOff"					;//���� �����!
	SheepKiller					=	"SVM_4_SheepKiller"					;//��! ������ ����� ���� � �����!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//���� ������ ������ ����� ����!
	YouMurderer					=	"SVM_4_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//��� ��� ����� ������ �����?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//������ �� ��������!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//�� ��� ����������.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//������ ����� �� �������...
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//��� ���� ��� ���� �����, �?!
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//�������� ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//����!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//����� �������...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//�������, ������� �����!
	ThiefDown					=	"SVM_4_ThiefDown"					;//������� �������� �� ���� ����� - �����?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//������ �� ��������� ����!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//������ ������� �������� �� ����� ����!
	KillMurderer				=	"SVM_4_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//���� � �� �������!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//����� ��� �������� ���� ������.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//������� � �������� ������!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//����� ������ � ���� �� ����� ��� - �������?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//����� � ����� ������, �����?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//������ ���� � �����!
	RunAway						= 	"SVM_4_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//�������!
	Guards						=	"SVM_4_Guards"					;//������!
	Help						=	"SVM_4_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//��! ��� ��� ����� ����������� � ����� �������!
	GoodKill					= 	"SVM_4_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//�� ��� �� ������, �� ��� � ��������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//�����!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//��� ���� ����� �����?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//��������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//��� �� ��� �����?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(�����������) � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//�� �� �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//������! ��� ���, � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(����������) ������ ��� �������� �� �����?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//�������� ��� ���������� ������ ����������!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//������ ��������? �������� ����������!!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_4_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(��������) ��, �����!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(����������� ����) �� ������� ���, ��� ����� �������!
	NotBad						= 	"SVM_4_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//��, ����� ���!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//������ ���!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//�������� ���!
	Ooh01						=	"SVM_4_Ooh01"					;//���������!
	Ooh02						=	"SVM_4_Ooh02"					;//������, ������ ���!
	Ooh03						=	"SVM_4_Ooh03"					;//���! ��� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(���� ��� ���, ����������) ����, ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//�������� � ���� �������!
	Awake						= "SVM_4_Awake"						;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//� ������, �� ��������� � �� � ��� ������.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//������.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//�������� ���� - ��� ��� �������! ����������!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//�� ������ - ��������!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//��������� ���! - � �� ���� ������ ����!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//� �� ������ ������ �� ��������! ���� ����� ����� ���������.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//��� ����� ��� �� ������ ��� ������� � ��������� ������? ���� ����� �������� ���� ��������� �� ���!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//���� ����� ������ � ����� ���������!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//���� ������ ����� � ������, ����� � ����� ���������!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//�� �� ������� ���� ���!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//����������� ������ ������ ��� ��� - � �� �������� �� ���!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//�� � ���� � ����... ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//���� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//�� �����!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 ������� �����.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...��� ������������� ������...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...� ������ ������...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...�� ������, ��� �� �� ���� �����...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...� ���� ��� ���� � �� ������, ���� ������...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...��� ��� �������...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...� ��� �� �����...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...� ������ ��� ���� �� ��������...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...��� �� ��� ��������...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...�� ������������� ������ � ���...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...����� ������ �� ������ � ����...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...��� ���� ������ ��������...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...�� ������ �� ��� �����...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...���� �� ����� �� �����, � ����� �� ���� ������...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...��� �� �������...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...�� ��� �� ������� �� ���������...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...��� ����� ��������...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...��� ������ ������...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...� �� ������ ��-�������...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...� ��������� � ����� ��������...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...���� ��� ����� �� �������...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...� ���� �� ���� �� ����...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...� ���� ������ �� ��������...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...��� �� �������� ����...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...�� �� ���������, ��� ��� ����� �����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...����� ������ ����, ��� ��� �� ����...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...�� ���� ��� ������ ������� �� ����...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...��, �� ������������� ������ ���...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...���-�� ������ ��������� �� ���...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...����� ���������� ���, ��� �������� ��� ��������...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...���������� ��������������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//��� ������ ������ ����� ����. �� ������� �����.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_4_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_4_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_4_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_4_KASERNE"					;//��� �������.
	HAFEN						= "SVM_4_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//������!
	Aargh_1						= "SVM_4_Aargh_1"					;//������!
	Aargh_2						= "SVM_4_Aargh_2"					;//������!
	Aargh_3						= "SVM_4_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//������� ������� ���������, ����� �� ���������.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//����� ������ �������, ���� ������ ���������� �� ����.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//���� ���, �� ������ �������? ����� ����� � ����� ��.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//��� ���� ������? ����� � �����������. ������ ����� � �������� � �����.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//��� ��, ����� �������, ��� ��? �����������, ����� ������ ���� �������.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//��� ���� ������!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//�� ��, ������� �����!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_5_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_5_Weather"						;//����� ������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_5_DieEnemy"					;//������ �� ��������!
	DieMonster					=	"SVM_5_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_5_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_5_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_5_SheepKiller"					;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_5_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//������ � �������� ���� ������!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//��� ���� ����� ����, �?!
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//�������, �������?!
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_5_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//� �����, ��� ������ ���� ��������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_5_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//� ������ �������� ������!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//������ ���� � �����!
	RunAway						= 	"SVM_5_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//�������!
	Guards						=	"SVM_5_Guards"						;//������!
	Help						=	"SVM_5_Help"						;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_5_GoodKill"					;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//�������� ����������, �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//�������� ������!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//��� ���� ����� �����?! �����!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//��, �������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//������! ��, ������ ������� �� ��������...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//�� � ���� ���� ��� ������ � �����?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//�, �������, ������ ���� ������, ��� ����� ���������� ��� ���� ��.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//��! ���������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(����������) �� ���� �������?
	StopMagic					=	"SVM_5_StopMagic"					;//������� �������� �� ���� � ���� ������!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//����� ��� �����! �� ���, �����?!
	WeaponDown					=	"SVM_5_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//�� ���, �����? � ������: ����� ������!
	WiseMove					=	"SVM_5_WiseMove"					;//������, ��� ���� �� ��� �� ������.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(��������) ������ �����������!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(����������) ��� ����� ���� ����� ���, ��� ���� �������...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(����������� ����) �� �������� ���!
	NotBad						= 	"SVM_5_NotBad"						;//(������������) ������ �� �����...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(���� ��� ���) ����� �� ��������...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//��, ��� ��� ��, ��� �����!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//���� �� �����?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//��� ���!
	Ooh01						=	"SVM_5_Ooh01"						;//�� ������� �����!
	Ooh02						=	"SVM_5_Ooh02"						;//������ ���, ��� ��� �������!
	Ooh03						=	"SVM_5_Ooh03"						;//���� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//�������� � ���� �������!
	Awake						= "SVM_5_Awake"							;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//� ������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//� ������, �� ����� � �� � ��� ������.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//� �� ������������ � �������� ������!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//����� � ���� ����, ������� ���!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//�� �������� ��� �����! ���� ����� ����� � ������!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//�� �������� ��������� ������! ���� ����� ������ ���� ������� �������!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//���� ����� ������ � ���, ��� �� ������!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//���� ������ �� ����� ���, ����� ������ �� ���� ���������!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//�� ������ ���� ������! �� ����� �������!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//����������� ������ ��������� �� ���� ����������!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//������, ������, �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//���� ��� ��� ��������, ��� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 ������� �����.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 ������� �����.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 ������� �����.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 ������� �����.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 ������� �����.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 ������� �����.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 ������� �����.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 ������� �����.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 ������� �����.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 ������� �����.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 ������� �����.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 ������� �����.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 ������� �����.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 ������� �����.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 ������� �����.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 ������� �����.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 ������� �����.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 ������� �����.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 ������� �����.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 ������� �����.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 ������� �����.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 ������� �����.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 ������� �����.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 ������� �����.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 ������� �����.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 ������� �����.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 ������� �����.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...�� ������������� �������...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...��� ��������...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...��� ������ ����� ��������...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...��� ����� � ���� ��� ���� ������� �� �������...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...��� ������ ���� ���...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...�� ����� ����� ���� ��������...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...����� ������ �����...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...�� ����� ����� � �� ����� �� �����...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...��� ��� �����...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...� �� �� ������� ����,  ��� ���� ��� ������...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...��������, � ������� ���� ������...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...����� ������� �� ���������� ����...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...���� ������ ���� ���� ����� �������...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...��� ������ ������...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...��� ��������� ��������...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...���� �� ����� ���������� ���� �� ����...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...��� ����� ������������ ��������...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...�� ��� ������, ��� � �����...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...��� ������ ���, ��� � ������...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...����� �� ������� ���...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...� ������ � �� ������ �� ���� ������...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...���������, ��� ����� ������...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...��������� �������� �������� ���� �����...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...� ������ �� ���� ������� �� ����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...�� ������� � �������...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...� �� ������� ��� ���������� � �����...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...��� ��� ����������� ��� �����, � � ������� ������ ����...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...��� ��������� � �������...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...� ������ �������� ���, ��� ������� �����...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...����� �� ����� �������� ������������ �������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_5_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_5_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_5_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_5_KASERNE"					;//��� �������.
	HAFEN						= "SVM_5_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//������!
	Aargh_1						= "SVM_5_Aargh_1"					;//������!
	Aargh_2						= "SVM_5_Aargh_2"					;//������!
	Aargh_3						= "SVM_5_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//��� ������ ������ ���-������ ���������������.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//��� �� ���� ������? �� ���, ������ �� ���� �� ���? ����� � �� ���� ����� � ����� ����.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//��, �������, ��������� �� ������, ��� ��� ����� �� ���� ������ ��� �������.
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//����� ���� ������ �������, ���� �� �� ��� ����� �� ������? ������� �� ����.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//��� �� �� ����������? � ���� ���� ��� ��������. ��� �����.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//���, ������!
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//� ����� ���� �� �����, �����!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_6_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_6_Weather"					;//�������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//������ �� � ���� ��������!
	DieEnemy					=	"SVM_6_DieEnemy"					;//���� �� ������ ���������� �����!
	DieMonster					=	"SVM_6_DieMonster"					;//��� ����, ������� �����!
	DirtyThief					=	"SVM_6_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_6_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_6_SheepKiller"				;//������ ����� ���� � �����!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//������ �� ����� ����, ��, �������� !
	YouMurderer					=	"SVM_6_YouMurderer"				;//������!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//�� ��������� �� ����!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//� ������������ ����.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//��, �������� ������!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//��! ��� ���� ���� ����� ���?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//��������! ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//� ������ ���� �����, �������!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//�������...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//��, � ��� ��������!
	ThiefDown					=	"SVM_6_ThiefDown"					;//� ������������ ����! �� ������� ��������� ���, ������� ���!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//� �����, ��� ������ ���� ��������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//� ������� �������� �� ����� ����!
	KillMurderer				=	"SVM_6_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//����  �� ������� �������� �� ����!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//� ������������ ����.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//� ������ ��������!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//� ������ �� ���� ������ ���� �����, �����?!
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//������� ���� �����. ����� ��� �������� ���� ������.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//�� ������� ���-������ ��������!
	RunAway						= 	"SVM_6_RunAway"						;//� ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//�������!
	Guards						=	"SVM_6_Guards"					;//������!
	Help						=	"SVM_6_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//������ ���� ������, ��� ���� ������!
	GoodKill					= 	"SVM_6_GoodKill"				;//��, ������ ����� �������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//� ���� ��� �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//���� ������ ����� ������!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//��, ��������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//��� �� �������? ��� �� ��� ����������?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(�����������) ����, ��� ���� �����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//��, �� ������� ����, � ���� ���� ������ � �����.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//���� ������ ��� - ����...
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//�������, � ������ ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(��������������) ������! �� ����� ����� ������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(����������) ������ ��� ��������?
	StopMagic					=	"SVM_6_StopMagic"				;//����� ��� �����!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//��������� ��������������! ����� ��� �����!
	WeaponDown					=	"SVM_6_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//����� ���, ��� � �� ���� �� �������!
	WiseMove					=	"SVM_6_WiseMove"				;//��, �� �� ����� �����, ��� ��������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(���� ��� ���) ������ �������� ������� ��� �����...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(���� ��� ���) ���! ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(�����) � ������ ������ ����� ������������...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(����������) ��, ��� ���...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(����������� ����) ����� ��� �������� ������ ��� ����...
	NotBad						= 	"SVM_6_NotBad"					;//(������������) ��� �� ��� ���!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(���� ��� ���) ����� �� ��������!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//�������� ���!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//�� ��������������!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//�������� ���!
	Ooh01						=	"SVM_6_Ooh01"					;//���������!
	Ooh02						=	"SVM_6_Ooh02"					;//��������� ��!
	Ooh03						=	"SVM_6_Ooh03"					;//��, ��� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_6_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//��� ������, �� ����� ��� �������� � �����������.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//���� ������ �������� ���� ���� �����.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//������, �� ����� � �� � ����� ��� ��������.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//������.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//�� ��������� �� ����? � �� �� ������ ������� ���� ��� ����� ����������� ������?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//� �� ������� � ���������!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//� �� ���� ��� � ������!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//� �� ������ ����� ���������? �������, ��� ���� ����� ������ �� ����!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//�� ������������� �������� � ��������� ������? ���� ����� �� �������� ������!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//��� � ����� �����, ���� ��� �� ������.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//��� � ���� �������. �� �������� ���� ���� �����!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//�� ������ �� ����, � ���� �������� ���������.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//������������ ������� ��� �� ����������. ���� ����� ���������� � ���, ���� �� ������!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//������, �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//� �����, ������ �� ���������, � ��� �� ������ ����. ���� �� ������?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//����� ��? ������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 ������� �����.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...�� ���� �������� � ���...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...� �� ��� �� ��� ������...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...�� �� ��� ����� ���� �� ����...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...� ������ ���� �� ����, ���� ������...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...� �� ����, ��� ��� ��� ��������...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...� ���� � ��� ������� �������...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...� ���-�� ������ �� ����...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...� �� ���� ����� � ����� �������� ���������...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...�� ����� ������ �����, ��� �������...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...�� ����� ��� �� �� ����...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...� ��� ��������� �� ����...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...������ �� ��������� ��� ������...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...�� �� �������� �����...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...�� ������, ��� �� �� ���� �����...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...��� ���� ��������...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...��� �� ��� �������...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...��� ����� ������������ ��������...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...� ���� ����������� ������ �� ���� ����...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...��� ���� ���, ��� �� ������...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...� �� ����, ��� ��� ���-�� �������...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...������ ��� ����� �� ����...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...��� �������� ������ �����...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...� ����, ��� ��� ����� ���������...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...������ ��� �� ������� ����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...�� ����� ���, ��� ����� �� ��� ������ ��� ������...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...�������, � ����� ������, �� ��� �������...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...�� ������ ��� ���������� ��������...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...��������� ���� �� �����, ��������� ��� �������...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...������ ���� ������...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...��� ���� ���� ����������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_6_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_6_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_6_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_6_KASERNE"					;//��� �������.
	HAFEN						= "SVM_6_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//������!
	Aargh_1						= "SVM_6_Aargh_1"					;//������!
	Aargh_2						= "SVM_6_Aargh_2"					;//������!
	Aargh_3						= "SVM_6_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//� ���� ����� �� ��������� ������. ������ ���-������ ���������.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//�� ������� �� ��, ��� � ���� �� �����? ������ � �����������.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//������! ��� �� ���� ������? �����������. � ����������!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//����� ������ �� ������ ����������. ����� � ������ ���� ����.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//�� ������� ���, ��� �������. ���� ����� ������ ���-������.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//�� �� �� ���� �����, �������!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//����������� � ����, �����!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_7_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_7_Weather"						;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//����� ��!
	DieEnemy					=	"SVM_7_DieEnemy"					;//� ������� ���� �� �����!
	DieMonster					=	"SVM_7_DieMonster"					;//��� ���� �����!
	DirtyThief					=	"SVM_7_DirtyThief"					;//�� �� ������ ���!
	HandsOff					=	"SVM_7_HandsOff"					;//���� �����!
	SheepKiller					=	"SVM_7_SheepKiller"					;//��! ������ ����� ���� � �����!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//���� ������ ������ ����� ����!
	YouMurderer					=	"SVM_7_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//��� ��� ����� ������ �����?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//������ �� ��������!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//�� ��� ����������.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//������ ����� �� �������...
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//��� ���� ��� ���� �����, �?!
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//�������� ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//����!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//����� �������...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//�������, ������� �����!
	ThiefDown					=	"SVM_7_ThiefDown"					;//������� �������� �� ���� ����� - �����?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//������ �� ��������� ����!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//������ ������� �������� �� ����� ����!
	KillMurderer				=	"SVM_7_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//�� ������� ��������� ���, �������!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//����� ��� �������� ���� ������.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//������� � �������� ������!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//����� ������ � ���� �� ����� ���! �������?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//����� � ����� ������, �����?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//������ ���� � �����!
	RunAway						= 	"SVM_7_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//�������!
	Guards						=	"SVM_7_Guards"					;//������!
	Help						=	"SVM_7_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//��! ��� ��� ����� ����������� � ����� �������!
	GoodKill					= 	"SVM_7_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//�� ��� �� ������, �� ��� � ��������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//�����!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//��� ���� ����� �����?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//��������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//��� �� ��� �����?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(�����������) � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//�� �� �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//������! ��� ���, � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(����������) ������ ��� �������� �� �����?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//�������� ��� ���������� ������ ����������!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//������ ��������? �������� ����������!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_7_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(��������) ��, �����!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(����������� ����) �� ������� ���, ��� ����� �������!
	NotBad						= 	"SVM_7_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//��, ����� ���!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//������ ���!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//����� ���!
	Ooh01						=	"SVM_7_Ooh01"					;//���������!
	Ooh02						=	"SVM_7_Ooh02"					;//������, ������ ���!
	Ooh03						=	"SVM_7_Ooh03"					;//���! ��� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(���� ��� ���, ����������) ����, ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//�������� � ���� �������!
	Awake						= "SVM_7_Awake"						;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//� ������, �� ��������� � �� � ��� ������.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//������.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//�������� ���� - ��� ��� �������! ����������!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//�� ������, ��������!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//��������� ���! � �� ���� ������ ����!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//� �� ������ ������ �� ��������! ���� ����� ����� ���������.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//��� �����, ��� ��, ������ ��� ������� � ��������� ������? ���� ����� �������� ���� ��������� �� ���!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//���� ����� ������ � ����� ���������!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//���� ������ ����� � ������, ����� � ����� ���������!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//�� �� ������� ���� ���!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//����������� ������ ������ ��� ��� - � �� �������� �� ���!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//�� � ���� � ����... ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//���� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//�� �����!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 ������� �����.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...��� ������������� ������...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...� ������ ������...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...�� ������, ��� �� �� ���� �����...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...� ���� ��� ���� � �� ������, ���� ������...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...��� ��� �������...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...� ��� �� �����...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...� ������ ��� ���� �� ��������...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...��� �� ��� ��������...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...�� ������������� ������ � ���...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...����� ������ �� ������ � ����...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...��� ���� ������ ��������...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...�� ������ �� ��� �����...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...���� �� ����� �� �����, � ����� �� ���� ������...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...��� �� �������...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...�� ��� �� ������� �� ���������...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...��� ����� ��������...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...��� ������ ������...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...� �� ������� � ����� ��-�������...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...� ��������� � ����� ��������...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...���� ��� ����� ��-�������...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...� ���� �� ���� �� ����...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...� ���� ������ �� ��������...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...��� �� �������� ����...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...�� �� ���������, ��� ��� ����� �����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...����� ������ ����, ��� ��� �� ����...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...�� ���� ��� ������ ������� �� ����...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...��, �� ������������� ������ ���...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...���-�� ������ ��������� �� ���...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...����� ���������� ���, ��� �������� ��� ��������...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...���������� ��������������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//��� ������ ������ ����� ����. �� ������� �����.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_7_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_7_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_7_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_7_KASERNE"					;//��� �������.
	HAFEN						= "SVM_7_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//������!
	Aargh_1						= "SVM_7_Aargh_1"					;//������!
	Aargh_2						= "SVM_7_Aargh_2"					;//������!
	Aargh_3						= "SVM_7_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//����� ���� ��������? ��� � �� ���� � ����� �������������.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//��� �� �����? ��� ���� �������? ������ ����������!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//��� ��������� ��������� ��������. �����������! ������ ��!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//������� ���� ������ ����. � ���� � �� ���� ������������� � ����� � ���� ���� �������� �� ����.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//��� �� ������? �� �� �� �����, �� ���� �� ������ ���� �������.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//����, ������ ���������!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//����, ���������� �����!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_8_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_8_Weather"					;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_8_DieEnemy"					;//� ������� ���� �� �����!
	DieMonster					=	"SVM_8_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_8_DirtyThief"					;//������� ���! ��, �������!
	HandsOff					=	"SVM_8_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_8_SheepKiller"				;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_8_YouMurderer"				;//������!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//�� �� ������ ����? ������!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//��� ���� ���� ����� ���?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//�� �������� ���, �������!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_8_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_8_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//� ������ �������� ������!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//�� ������ ����!
	RunAway						= 	"SVM_8_RunAway"					;//��, ����!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//�������!
	Guards						=	"SVM_8_Guards"					;//������!
	Help						=	"SVM_8_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_8_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//��! ����, ���� ������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//��� ���� ����� �����?! �����!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//��, �������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//�� ��, �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//������! ��� ���, � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//���� ��� ��� ����?
	StopMagic					=	"SVM_8_StopMagic"				;//�������� ��� ���������� ������!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//������ ��������? �������� ����������!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_8_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(��������) �-��, �����!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(����������� ����) �� ������� ���!
	NotBad						= 	"SVM_8_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//����� ���!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//����������, ��!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//������ ���!
	Ooh01						=	"SVM_8_Ooh01"					;//�������!
	Ooh02						=	"SVM_8_Ooh02"					;//���������!
	Ooh03						=	"SVM_8_Ooh03"					;//�! ��� �� ��� ���!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_8_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//�������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//�������, �� ��������� � �� � ��� ������.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//������ ���� � �����, ������� ��������!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//������ ���� � �����, ���������� �������!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//�� �������� ��� �����! �������, ���� ����� ������ �� ����!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//�� �������� ��������� ������! �������, ���� ����� ������ �� ����!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//�������, ���� ����� ������ �� ����.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//�������, ���� ������ ������ �� ����!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//�������, �� ������ �� ����...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//�������, ����������� ������ ������ �� ����!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//������, ������, �� ������ ����. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//� �����, ��� ������ �� ��������� ������, ��� �� ��� �������... ���� �� ������?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//� �����, �� ������ ��������� �� ����. �� ���������? �� ������������� �������, ��? (�������)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 ������� �����.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...��� ������������� ������...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...� ������ ������...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...�� ������, ��� �� �� ���� �����...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...� ���� ��� ���� � �� ������, ���� ������...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...��� ��� �������...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...� ��� �� �����...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...���� ������ ������ �� ��������...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...��� �� ��� ��������...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...�� ������������� ������ � ���?..
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...����� ������ �� ������ � ����...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...��� ���� ������ ��������...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...�� ������ �� ��� �����...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...���� �� ����� �� �����, � ����� �� ���� ������...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...��� �� �������...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...�� ��� �� ������� �� ���������...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...��� ����� ��������...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...��� ������ ������...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...� �� ������ ��� ��-�������...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...� ��������� � ����� ��������...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...���� ��� ����� ��-�������...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...� ���� �� ���� �� ����...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...� ���� ��� ������ �� ��������...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...��� �� �������� ����...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...�� �� ���������, ��� ��� ����� �����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...����� ������ ����, ��� ��� �� ����...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...�� ���� ��� ������ ������� �� ����...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...��, �� ������������� ������ ���...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...���-�� ������ ��������� �� ���...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...����� ���������� ���, ��� �������� ��� ��������...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...���������� ��������������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//��� ������ ������ ����� ����. �� ������� �����.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_8_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_8_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_8_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_8_KASERNE"					;//��� �������.
	HAFEN						= "SVM_8_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//������!
	Aargh_1						= "SVM_8_Aargh_1"					;//������!
	Aargh_2						= "SVM_8_Aargh_2"					;//������!
	Aargh_3						= "SVM_8_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//� ���� �� ����. �� ���-�� �� ��� ���������, ����� ����, ���� � ������.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//���� �� ����, ��� �� ���������, �� �� �� �����. �� ���� ����� � ����� ����.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//��� ����� ���� ���������. ��� ��� ����� � ������ �������.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//����� ����� ������ ��� ���� � ���������. �����, �����������.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//� � ���������� �� ������������. � ���� ���� �������� ���.

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//��, ������� ���������!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//������!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_9_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_9_Weather"						;//�������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_9_DieEnemy"					;//���� �� ������ ���������� �����!
	DieMonster					=	"SVM_9_DieMonster"					;//��� ����, ������ �����!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//��� ���� �����!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//��� ��� ���� ������� �������!
	DirtyThief					=	"SVM_9_DirtyThief"					;//������� ���! ��, �������!
	HandsOff					=	"SVM_9_HandsOff"					;//����� ���� ����!
	SheepKiller					=	"SVM_9_SheepKiller"				;//������ ����� ���� � �����!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//������� �������� �� ����� ����!
	YouMurderer					=	"SVM_9_YouMurderer"				;//������!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//�� ��������� �� ����!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//� ������������ ����!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//� ������, ����� �����!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//��, ��� �� ��� �������?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//�������� ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//� ������ ����, �������!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//��� ����...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Schei�e!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//� ����� ���������, ������� �����!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//��� ����� �������� ������!
	ThiefDown					=	"SVM_9_ThiefDown"					;//������������ ����! ������� ������ ��������, ������� ���!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//� �����, ��� ������ ���� ��������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//� ������� �������� �� ����� ����!
	KillMurderer				=	"SVM_9_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//��� �� ����� �����!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//����  �� ������� �������� �� ����!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//� ������������ ����!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//� ������ ��������!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//� �� ���� ������ ���� �����, �����?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//����� ����� ���������. �� ������� �� ����!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//�� ����� ���������!
	RunAway						= 	"SVM_9_RunAway"						;//� ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//�������!
	Guards						=	"SVM_9_Guards"					;//������!
	Help						=	"SVM_9_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//������ ���� ������, ��� ���� ������!
	GoodKill					= 	"SVM_9_GoodKill"				;//��, ������ ����� �������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//� ���� �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//���� ������ ������ �����!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//��, ���������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//��� �� �������? ��� �� ��� ����������?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(�����������) ����, ��� ���� �����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//��, �� ������� ����, � ���� ���� ������ � �����.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//���� ������ ��� - ��-�-�.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//�������, � ������ ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(��������������) ������! �� ����� ����� ������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(����������) ������ �������� ���?
	StopMagic					=	"SVM_9_StopMagic"				;//����� ��� �����!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//��������� ��������������! ����� ��� �����!
	WeaponDown					=	"SVM_9_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//����� ���, ��� � �� ���� �� �������!
	WiseMove					=	"SVM_9_WiseMove"				;//��, �� �� ����� �����, ��� ��������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(���� ��� ���) ������ ��� ��������...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(���� ��� ���) ��! ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(�����) � ������ ������ ����� ������������...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(����������) ��, ��� ���...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(����������� ����) ����� ��� �������� ������ ��� ����...
	NotBad						= 	"SVM_9_NotBad"					;//(������������) ��� �� ��� ���!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(���� ��� ���) ����� �� ��������!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//�������� ���!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//�� ��������������!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//�������� ���!
	Ooh01						=	"SVM_9_Ooh01"					;//���������!
	Ooh02						=	"SVM_9_Ooh02"					;//��������� ��!
	Ooh03						=	"SVM_9_Ooh03"					;//��, ��� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_9_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//��� ������, �� ����� ��� �������� � �����������.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//���� ������ �������� ���� ���� �����.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//��� �� ����� � �� � ��� ������.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//������.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//�� ��������� �� ����? � �� �� ������ ������� ���� ��� ����� ����������� ������?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//� �� ������� � ���������!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//� �� ���� ��� � ������!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//��� �� ������ ����� ���������? ��, �������, ��� ���� ����� ������ � ����� �����!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//�� ������������� �������� � ��������� ������? ���� ����� �� �������� ������!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//��� � ����� �����, ���� ��� �� ������.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//��� � ���� �������. �� �������� ���� ���� �����!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//�� ������ �� ���� � ���� �������� ���������.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//������������ ������� ��� �� ����������. ���� ����� ���������� � ���, ���� �� ������!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//������, �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//� �����, ������ �� ���������, � ��� �� ������ ����. ���� �� ������?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//����� ��? ������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 ������� �����.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...�� ���� �������� � ���...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...� �� ��� �� ��� ������...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...�� �� ��� ����� ���� �� ���� ...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...� ������ ���� �� ����, ���� ������...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...� �� ����, ��� ��� ��� ��������...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...� ���� � ��� ������� �������...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...� ���-�� ������ �� ����...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...� �� ���� ����� � ����� �������� ���������...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...�� ����� ������ �����, ��� �������...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...�� ����� ��� �� �� ����...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...� ��� ��������� �� ����...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...������ �� ��������� ��� ������...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...�� �� �������� �����...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...�� ������, ��� �� �� ���� �����...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...��� ���� ��������...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...��� �� ��� �������?..
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...��� ����� ������������ ��������...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...� ���� ����������� ������ �� ���� ����...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...��� ���� ���, ��� �� ������...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...� �� ����, ��� ��� ���-�� �������...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...������ ��� ����� �� ����...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...��� �������� ������ �����...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...� ����, ��� ��� ����� ���������...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...������ ��� �� ������� ����?..
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...�� ����� ���, ��� ����� �� ��� ������ ��� ������...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...�������, � ����� ������, �� ��� �������...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...�� ������ ��� ���������� ��������...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...��������� ���� �� �����, ��������� ��� �������...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...������ ���� ������...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...��� ���� ���� ����������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//�� ������ ������, ��� � ���� ������� ����.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//��� ������ ������ ����� ����. �� ��� ������� �����.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_9_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_9_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_9_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_9_KASERNE"					;//��� �������.
	HAFEN						= "SVM_9_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//����� �� ����� � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//������!
	Aargh_1						= "SVM_9_Aargh_1"					;//������!
	Aargh_2						= "SVM_9_Aargh_2"					;//������!
	Aargh_3						= "SVM_9_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//��� ��� �� �������? ������ ���-������, ��� ���� ��������.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//��� �� ���� ������? �� ������ ������ ���� �������!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//�� ��������� �� ������, ��� ��� ���� ������� ������ ������� ����������� �������. �����������.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//���� ������ �� �������� ����� ������ ������. ����� � �����������.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//� ���� ���� ��� ��������. ������!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//������ ���� �������, ���������!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//���� �� ��������� ������������ �����, �����!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_10_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_10_Weather"						;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//����� ��!
	DieEnemy					=	"SVM_10_DieEnemy"					;//� ������� ���� �� �����!
	DieMonster					=	"SVM_10_DieMonster"					;//��� ���� �����!
	DirtyThief					=	"SVM_10_DirtyThief"					;//�� ��, ������ ���!
	HandsOff					=	"SVM_10_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_10_SheepKiller"					;//��! ������ ����� ���� � �����!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//���� ������ ������ ����� ����!
	YouMurderer					=	"SVM_10_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//��� ��� ����� ������ �����?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//������ �� ��������!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//�� ��� ����������.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//������ ����� �� �������...
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//��� ���� ��� ���� �����, �?!
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//�������� ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//����!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//����� �������...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//�������, ������� �����!
	ThiefDown					=	"SVM_10_ThiefDown"					;//� ������� ����� ���� ���� �������� �� ���� ����� - �����?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//������ �� ��������� ����!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//������ ������� �������� �� ����� ����!
	KillMurderer				=	"SVM_10_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//��� �� ����� �����!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//���� � �� �������!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//����� ��� �������� ���� ������.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//������� � �������� ������!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//����� ������ � ���� �� ����� ��� - �������?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//����� � ����� ������, �����?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//������ ���� � �����!
	RunAway						= 	"SVM_10_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//�������!
	Guards						=	"SVM_10_Guards"					;//������!
	Help						=	"SVM_10_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//��! ��� ��� ����� ����������� � ����� �������!
	GoodKill					= 	"SVM_10_GoodKill"				;//��� ������ �������� �� ��������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//�� ��� �� ������, �� ��� � ��������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//�����!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//��� ���� ����� �����?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//��, ����������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//��� �� ��� �����?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(�����������) � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//�� � ���� ���� ��� ������ � �����!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//�, �������, ������ ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(��������������) ���������! ��� ���, � �� ����������� �� ���.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(����������) ������ ��� ��� �������� �� �����?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//�������� ��� ���������� ������ ����������!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//�� ��������������! �������� ����������!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//����� ��� ������!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//�� ����� �� ���!
	WiseMove					=	"SVM_10_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(���� ��� ���) ��, �� ��� ���������...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(��������) �-��, �����!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(� ����������� ������) �� ������� ���!
	NotBad						= 	"SVM_10_NotBad"					;//�������...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//��, ����� ���!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//������ ���!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//�������� ���!
	Ooh01						=	"SVM_10_Ooh01"					;//���������!
	Ooh02						=	"SVM_10_Ooh02"					;//����� ��, �������!
	Ooh03						=	"SVM_10_Ooh03"					;//��-�! ��� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(���� ��� ���, ����������) ����, ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//�������� � ���� �������!
	Awake						= "SVM_10_Awake"						;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//� ������, �� ��������� � �� � ��� ������.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//�������� ���� - ��� ��� �������! ����������!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//�� ������ - ��������!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//��������� ���! - � �� ���� ������ ����!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//� �� ������ ������ �� ��������! ���� ����� ����� ���������.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//��� �����, ��� ��, ������ ��� ������� � ��������� ������? ���� ����� �������� ���� ��������� �� ���!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//���� ����� ������ � ����� ���������!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//���� ������ ����� � ������, ����� � ����� ���������!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//�� �� ������� ���� ���!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//����������� ������ ������ ��� ��� - � �� �������� �� ���!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//�� � ���� � ����... ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//���� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//�� �����!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 ������� �����.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...����� �����������...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...����� ������ �� ����� �����...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...�� ��� ��� �����...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...������� �� ����, ����� ���...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...� ����� �� ���� �����������...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...� ���� ��� ������� �� ���...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...� �� ��� �� ����...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...����� �� ������, �� ����...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...����� ����, ������ ���...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...����� � ���� ������� �� ����...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...�� ��� �� ����� ���������...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...� ���� ��� ������...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...� ��� ��� �� ���, ������ ���...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...����� �� �� �����...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...����� ���, ��� ��� �� ���...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...���� ��� ������ ��� ������ ���� ���������...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...��� ������ ��� ��� ��������...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...������ �� ���������...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...��� �� ������...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...���� ���, ������� ����...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...�� ������, ��� ��� ������...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...������ ��� �� ��������� ...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...� ��� ������...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...������ ��������, ��� �� �������...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...���� �� �� ��� � ����, ��� ���� �� ��-�������...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...��� ����� ������ �������������...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...�� ��� �� �� ���� �����...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...����� ��� �����...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...���� ����������� ������ � �������...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...������ ����� �����, ��� ���������, � ��� ���...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_10_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_10_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_10_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_10_KASERNE"					;//��� �������.
	HAFEN						= "SVM_10_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//���� �� �������������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� ����, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//������!
	Aargh_1						= "SVM_10_Aargh_1"					;//������!
	Aargh_2						= "SVM_10_Aargh_2"					;//������!
	Aargh_3						= "SVM_10_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//��� �� ���� �� ����? ��� ������ ���� �� ��������. ������ ���� � �����.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//���� �� ���� �� ���, �� ������ ������ ���� �����. ��� ��� ����� � ������ ��.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//���� �� ���� ������ ������� ����������� �������, ���� ������� �� ������.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//���� �� ������������� �� ����, �� ������������� � �� ������. ���� ������� ���������� �� ����.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//���� �� ���� �� ������ ��������� ���� �������, ����� ��� ������������� � �����?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//��, ������� ���������!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//��, ������� �����!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(������) �������!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_11_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_11_Weather"						;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_11_DieEnemy"					;//������ �� ��������!
	DieMonster					=	"SVM_11_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_11_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_11_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_11_SheepKiller"					;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_11_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//������ � �������� ���� ������!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//��� ���� ����� ����, �?!
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//�������, �������?!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_11_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//� �������, ����� ���� ���� �������� �� ����� �����!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_11_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//� ������, �������� ������!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//����� � �����!
	RunAway						= 	"SVM_11_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//�������!
	Guards						=	"SVM_11_Guards"						;//������!
	Help						=	"SVM_11_Help"						;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_11_GoodKill"					;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//�������� ����������, �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//�������� ������!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//��� ���� ����� �����!? �����!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//��, ���������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//������! ��, ������ ������� �� ��������...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//�� � ���� ���� ��� ������ � �����?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//�, �������, ������ ���� ������, ��� ����� ���������� ��� ���� ��.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//��! ���������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(����������) �� ���� �������?
	StopMagic					=	"SVM_11_StopMagic"					;//������� �������� �� ���� � ���� ������!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//����� ��� �����! �� ���, �����!?
	WeaponDown					=	"SVM_11_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//�� ���, �����? � ������: ����� ������!
	WiseMove					=	"SVM_11_WiseMove"					;//������, ��� ���� �� ��� �� ������.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(��������) ������ �����������!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(����������) ��� ����� ���� ����� ���, ��� ���� �������...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(����������� ����) �� �������� ���!
	NotBad						= 	"SVM_11_NotBad"						;//(������������) ������ �� �����...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(���� ��� ���) ����� �� ��������...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//��, ��� ��� ��, ��� �����!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//���� �� �����?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//��� ���!
	Ooh01						=	"SVM_11_Ooh01"						;//�� ������� �����!
	Ooh02						=	"SVM_11_Ooh02"						;//������ ���, ��� ��� �������!
	Ooh03						=	"SVM_11_Ooh03"						;//���� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(���� ��� ���, ����������) ��� ��� ����!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//�������� � ���� �������!
	Awake						= "SVM_11_Awake"							;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//� ������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//�������, �� ��������� � �� � ��� ������.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//� �� ������������ � �������� ������!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//�����, � ���� ����, ������� ���!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//�� �������� ��� �����! ���� ����� ����� � ������!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//�� �������� ��������� ������! ���� ����� ������ ���� ������� �������!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//���� ����� ������ � ���, ��� �� ������!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//���� ������ ����� ���������, ����� ������ �� ����!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//�� ������ ���� ������! �� ����� �������!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//����������� ������ ��������� �� ���� ����������!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//������, ������, �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//���� ��� ��� ��������, ��� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 ������� �����.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 ������� �����.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 ������� �����.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 ������� �����.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 ������� �����.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 ������� �����.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 ������� �����.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 ������� �����.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 ������� �����.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 ������� �����.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 ������� �����.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 ������� �����.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 ������� �����.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 ������� �����.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 ������� �����.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 ������� �����.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 ������� �����.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 ������� �����.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 ������� �����.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 ������� �����.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 ������� �����.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 ������� �����.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 ������� �����.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 ������� �����.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 ������� �����.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 ������� �����.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 ������� �����.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//... �� ������������� �������...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//... ��� ��������...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//... ��� ������ ����� ��������...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//... ��� ����� � ���� ��� ���� ������� �� �������...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//... ��� ������ ���� ���...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//... �� ����� ����� ���� ��������...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//... ����� ������ �����...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//... �� ����� ����� � �� ����� �� �����...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//... ��� ��� �����...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//... � �� �� ������� ����,  ��� ���� ��� ������...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//... ��������, � ������� ���� ������...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//... ����� ������� �� ���������� ����...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//... ���� ������ ���� ���� ����� �������...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//... ��� ������ ������...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//... ��� ��������� ��������...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//... ���� �� ����� ���������� ���� �� ����...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//... ��� ����� ������������ ��������...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//... �� ��� ������, ��� � �����...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//... ��� ������ ���, ��� � ������...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//... ��� ������ �� �������...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//... � ������ � �� ������ �� ���� ������...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//... ���������, ��� ����� ������...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//... ��������� �������� �������� ���� �����...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//... � ������ �� ���� ������� �� ����...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//... �� ������� � �������...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//... � �� ������� ��� ���������� � �����...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//... ��� ��� ����������� ��� �����, � � ������� ������ ����...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//... ��� ��������� � �������...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//... � ������ �������� ���, ��� ������� �����...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//... ����� �� ����� �������� ������������ �������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_11_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_11_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_11_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_11_KASERNE"					;//��� �������.
	HAFEN						= "SVM_11_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//������!
	Aargh_1						= "SVM_11_Aargh_1"					;//������!
	Aargh_2						= "SVM_11_Aargh_2"					;//������!
	Aargh_3						= "SVM_11_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//��� �� ���� �� ������? ��� ���� �� ��������. ������ ���� � �����.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//���� ���� �������� ���� �������, ����� � ������ � �����. �����, �����.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//���� ������� ������ ������� ����������� �������. ��� ��.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//���� ������ �� ������������� ������ ������. ����� � �����������.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//� ���� ���� ��� ��������. ������!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//��� ���� ������.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//������!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_12_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_12_Weather"					;//�������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_12_DieEnemy"					;//���� �� ������ ���������� �����!
	DieMonster					=	"SVM_12_DieMonster"					;//��� ����, ������ �����!
	DirtyThief					=	"SVM_12_DirtyThief"					;//������� ���! �� �������!
	HandsOff					=	"SVM_12_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_12_SheepKiller"				;//������ ����� ���� � �����!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//������� �������� �� ����� ����!!
	YouMurderer					=	"SVM_12_YouMurderer"				;//������!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//�� ��������� �� ����!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//� ������������ ����!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//� ������, ����� �����!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//��, ��� �� ��� �������?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//�������� ����������!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//� ������ ����, �������!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//��� ����...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//��� ��� ���� ��������!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//��� ����� �������� ������!
	ThiefDown					=	"SVM_12_ThiefDown"					;//������������ ����! ������� ������ ��������, ������� ���!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//� �����, ��� ������ ���� ��������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//� ������� �������� �� ����� ����!
	KillMurderer				=	"SVM_12_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//��� �� ����� �����!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//����  �� ������� �������� �� ����!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//� ������������ ����!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//� ������ ��������!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//� �� ���� ������ ����� ���� ������, �����?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//����� ����� ���������. �� ������� �� ����!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//�� ����� ���������!
	RunAway						= 	"SVM_12_RunAway"						;//� ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//�������!
	Guards						=	"SVM_12_Guards"					;//������!
	Help						=	"SVM_12_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//������ ���� ������, ��� ���� ������!
	GoodKill					= 	"SVM_12_GoodKill"				;//��, ������ ����� �������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//� ���� �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//���� ������ ������ �����!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//��, ���������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//��� �� �������? ��� �� ��� ����������?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(�����������) ����, ��� ���� �����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//��, �� ������� ����, � ���� ���� ������ � �����.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//���� ������ ��� - ����.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//�������, � ������ ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(��������������) ������! �� ����� ����� ������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(����������) ������ �������� ���?
	StopMagic					=	"SVM_12_StopMagic"				;//����� ��� �����!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//��������� ��������������! ����� ��� �����!
	WeaponDown					=	"SVM_12_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//����� ���, ��� � �� ���� �� �������!
	WiseMove					=	"SVM_12_WiseMove"				;//��, �� �� ����� �����, ��� ��������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(���� ��� ���) ������ ��� �������� ...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(���� ��� ���) ���! ��� ������ ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(�����) � ������, ������ ����� ������������ ...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(����������) ��, ��� ��� ...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(����������� ����) ����� ��� �������� ������ ��� ����...
	NotBad						= 	"SVM_12_NotBad"					;//(������������) ��� �� ��� ���!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(���� ��� ���) ����� �� ��������!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//�������� ���!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//�� ��������������!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//�������� ���!
	Ooh01						=	"SVM_12_Ooh01"					;//���������!
	Ooh02						=	"SVM_12_Ooh02"					;//��������� ��!
	Ooh03						=	"SVM_12_Ooh03"					;//��, ��� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(���� ��� ���, ����������) ��� ��� ����!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_12_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//��� ������, �� ����� ��� �������� � �����������.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//���� ������ �������� ���� ���� �����.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//��� �� ����� � �� � ��� ������.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//������.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//�� ��������� �� ����? � �� �� ������ ������� ���� ��� ����� ����������� ������?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//� �� ������� � ���������!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//� �� ���� ��� � ������!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//��� �� ������ ����� ���������? �� �������, ��� ���� ����� ������ � ����� �����!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//�� ������������� �������� � ��������� ������? ���� ����� �� �������� ������!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//��� � ����� �����, ���� ��� �� ������.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//��� � ���� �������. �� �������� ���� ���� �����!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//�� ������ �� ���� � ���� �������� ���������.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//������������ ������� ��� �� ����������. ���� ����� ���������� � ���, ���� �� ������!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//������ - �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//� �����, ������ �� ���������, � ��� �� ������ ����. ���� �� ������?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//����� ��? ������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 ������� �����.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//... ����� ����������� ...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//... ����� ������ �� ����� ����� ...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//... �� ��� ��� ����� ...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//... ������� �� ����, ����� ��� ...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//... � ����� �� ���� ����������� ...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//... � ���� ��� ������� �� ��� ...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//... � �� ��� �� ���� ...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//... ����� �� ������, �� ���� ...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//... ����� ����, ������ ��� ...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//... ����� � ���� ������� �� ���� ...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//... �� ��� �� ����� ��������� ...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//... � ���� ��� ������ ...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//... � ��� ��� �� ���, ������ ��� ...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//... ����� �� �� ����� ...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//... ����� ���, ��� ��� �� ��� ...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//... ���� ��� ������ ��� ������ ���� ��������� ...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//... ��� ������ �������� �� ���� ������� ...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//... ������ �� ��������� ...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//... ��� �� ������ ...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//... ���� ��� ������� ���� ...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//... �� ������, ��� ��� ������ ...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//... ������ ��� �� ���������  ...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//... � ��� ������ ...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...�� ������ �������� ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//... ���� �� �� ��� � ����, ��� ���� �� ��-������� ...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//... ��� ����� ������ ������������� ...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//... �� ��� �� �� ���� ����� ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//... ����� ��� ����� ...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//... ���� ����������� ������ � ������� ...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//... ������ ����� �����, ��� ���������, � ��� ��� ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//���������, �� ��� ����� ���� ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_12_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_12_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_12_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_12_KASERNE"					;//��� �������.
	HAFEN						= "SVM_12_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//������!
	Aargh_1						= "SVM_12_Aargh_1"					;//������!
	Aargh_2						= "SVM_12_Aargh_2"					;//������!
	Aargh_3						= "SVM_12_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//���� ������ ������ �� �������� ����. ��� ������ �����������.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//������ ���� �������, ���� ������ ������������� �� ����.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//������ ������ ������ ������� ����������� �������, � �� ��� ������! ��� ��� ���� ������� �����������.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//���� ������ �� ������������� ������ ������. ����� � �����������.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//�� ���� �� ������ ������ ���� �������. � �� ������������ �� ���������.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//� ����� ���� �� �����, �������!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//� ����� ���� �� �����, �����!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_13_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_13_Weather"					;//����� �������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//������ �� � ���� ��������!
	DieEnemy					=	"SVM_13_DieEnemy"					;//� ������� ���� �� �����!
	DieMonster					=	"SVM_13_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_13_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_13_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_13_SheepKiller"				;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_13_YouMurderer"				;//������!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//�� �� ������ �������? ������!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//��� ���� ���� ����� ���?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//�� �������� ���, �������!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_13_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//� �����, ��� ������ ���� ��������� �������� �� ����, ��� ���� �� �����������!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_13_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//� ������ �������� ������!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//�� ������ ����!
	RunAway						= 	"SVM_13_RunAway"					;//��, ����!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//�������!
	Guards						=	"SVM_13_Guards"					;//������!
	Help						=	"SVM_13_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_13_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//��! ���� �� ���� ���!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//��� ���� ����� �����?! �����!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//��, �������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//�� ��, �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//������! ��� ���, � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//���� ��� ��� ����?
	StopMagic					=	"SVM_13_StopMagic"				;//�������� ��� ���������� ������!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//������ ��������? �������� ����������!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_13_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(��������) ��, �����!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(����������� ����) �� ������� ���, ��� ����� �������!
	NotBad						= 	"SVM_13_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//����� ���!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//����������, ��!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//������ ���!
	Ooh01						=	"SVM_13_Ooh01"					;//�������!
	Ooh02						=	"SVM_13_Ooh02"					;//���������!
	Ooh03						=	"SVM_13_Ooh03"					;//��! ����� ����!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_13_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//�������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//�������, �� ��������� � �� � ��� ������.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//������ ���� � �����, ������� ��������!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//������ ���� � �����, ���������� �������!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//�� �������� ��� �����! �������, ���� ����� ������ �� ����!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//�� �������� ��������� ������! �������, ���� ����� ������ �� ����!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//�������, ���� ����� ������ �� ����.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//�������, ���� ������ ������ �� ����!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//�������, �� ������ �� ����...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//�������, ����������� ������ ������ �� ����!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//������, ������, �� ������ ����. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//� �����, ��� ������ �� ��������� ������, ��� �� ��� �������... ���� �� ������?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//� �����, �� ������ ��������� �� ����. �� ���������? �� ������������� �������, ��? (�������)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 ������� �����.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...����� �����������...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...����� ������ �� ����� �����...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...�� ��� ��� �����...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...������� �� ����, ����� ���...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...� ����� �� ���� �����������...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...� ���� ��� ������� �� ���...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...� �� ��� �� ����...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...����� �� ������, �� ����...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...����� ����, ������ ���...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...����� � ���� ������� �� ����...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...�� ��� �� ����� ���������...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...� ���� ��� ������...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...� ��� ��� �� ���, ������ ���...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...����� �� �� �����...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...����� ���, ��� ��� �� ���...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...���� ��� ������ ��� ������ ���� ���������...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...��� ������ ��� ��� ��������...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...������ �� ���������...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...��� �� ������...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...���� ���, ������� ����...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...�� ������, ��� ��� ������...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...������ ��� �� ��������� ...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...� ��� ������...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...�� ������ ��������...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...���� �� �� ��� � ����, ��� ���� �� ��-�������...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...��� ����� ������ �������������...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...�� ��� �� �� ���� �����?..
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...����� ��� �����...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...���� ����������� ������ � �������...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...������ ����� �����, ��� ���������, � ��� ���...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_13_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_13_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_13_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_13_KASERNE"					;//��� �������.
	HAFEN						= "SVM_13_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//������!
	Aargh_1						= "SVM_13_Aargh_1"					;//������!
	Aargh_2						= "SVM_13_Aargh_2"					;//������!
	Aargh_3						= "SVM_13_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//��� �� ���� ������? ��� ���� ������ �� ��������. ������ ���� � �����.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//�� �� ������ ���� �������... ����� � ������ ��.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//�� ������ ���������, ��� ������ ������ ������� ����������� �������, � �� ������� � ���� ���������. ��� ��!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//������ �� �� ������ ������, ��������������� ������ ������? ����� � ������� �� ����.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//�� � ���� ���� ��� ��������! ���� ������!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//��, ������� ���������!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//��, ���������� �����!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_14_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_14_Weather"						;//����� ������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_14_DieEnemy"					;//������ �� ��������!
	DieMonster					=	"SVM_14_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_14_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_14_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_14_SheepKiller"					;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_14_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//������ � �������� ���� ������!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//��� ���� ����� ����, �?!
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//�������, �������?!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_14_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//� �������, ����� ���� ���� �������� �� ����� �����!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_14_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//� ������, �������� ������!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//����� � �����!
	RunAway						= 	"SVM_14_RunAway"						;//����, � ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//�������!
	Guards						=	"SVM_14_Guards"						;//������!
	Help						=	"SVM_14_Help"						;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//������� - ����� ������� ������ ������!
	GoodKill					= 	"SVM_14_GoodKill"					;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//�������� ����������, �������!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//�������� ������!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//��� ���� ����� �����!? �����!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//��, ���������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(�����������) ����, � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//������! ��, ������ ������� �� ��������...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//�� � ���� ���� ��� ������ � �����?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//�, �������, ������ ���� ������, ��� ����� ���������� ��� ���� ��.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//��! ���������!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(����������) �� ���� �������?
	StopMagic					=	"SVM_14_StopMagic"					;//������� �������� �� ���� � ���� ������!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//����� ��� �����! �� ���, �����?!
	WeaponDown					=	"SVM_14_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//�� ������� ����? � ������: ����� ������!
	WiseMove					=	"SVM_14_WiseMove"					;//������, ��� ���� �� ��� �� ������.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(���� ��� ���) �� ��� ��������� �� ����...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(��������) ������ �����������!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(����������) ��� ����� ���� ����� ���, ��� ���� �������...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(����������� ����) �� �������� ���!
	NotBad						= 	"SVM_14_NotBad"						;//(������������) ������ �� �����...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(���� ��� ���) ����� �� ��������...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//��, ��� ��� ��, ��� �����!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//���� �� �����?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//��� ���!
	Ooh01						=	"SVM_14_Ooh01"						;//�� ������� �����!
	Ooh02						=	"SVM_14_Ooh02"						;//������ ���, ��� ��� �������!
	Ooh03						=	"SVM_14_Ooh03"						;//���� ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(���� ��� ���, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//�������� � ���� �������!
	Awake						= "SVM_14_Awake"							;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//� ������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//� ������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//�������, �� ��������� � �� � ��� ������.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//��� ������.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//�� ������� ����� ����!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//� �� ������������ � �������� ������!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//����� � ���� ����, ������� ���!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//�� �������� ��� �����! ���� ����� ����� � ������!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//�� �������� ��������� ������! ���� ����� ������ ���� ������� �������!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//���� ����� ������ � ���, ��� �� ������!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//���� ������ ����� ���������, ����� ������ �� ����!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//�� ������ ���� ������! �� ����� �������!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//����������� ������ ��������� �� ���� ����������!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//������-������, �� �������. ���� �� ������?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//���� ��� ��� ��������, ��� ��� �������?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//������ ��� ��� ��������� �� ����, ��?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 ������� �����.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 ������� �����.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 ������� �����.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 ������� �����.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 ������� �����.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 ������� �����.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 ������� �����.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 ������� �����.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 ������� �����.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 ������� �����.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 ������� �����.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 ������� �����.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 ������� �����.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 ������� �����.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 ������� �����.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 ������� �����.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 ������� �����.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 ������� �����.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 ������� �����.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 ������� �����.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 ������� �����.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 ������� �����.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 ������� �����.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 ������� �����.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 ������� �����.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 ������� �����.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 ������� �����.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...� �� ���� � ���...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...� �� ��� �� ��� ������...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...�� �� ��� ����� ���� �� ����...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...� ������ ���� �� ����, ���� ������...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...� �� ����, ��� ��� ��� ��������...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...� ���� � ��� ������� �������...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...� ���-�� ������ �� ����...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...� �� ���� ����� � ����� �������� ���������...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...�� ����� ������ �����, ��� �������...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...�� ����� ��� �� �� ����...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...� ��� ��������� �� ����...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...������ �� ��������� ��� ������...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...�� �� �������� �����...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...�� ������, ��� �� �� ���� �����...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...��� ���� ��������...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...��� �� ��� �������?..
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...��� ����� ������������ ��������...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...� ���� ����������� ������ �� ���� ����...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...��� ���� ���, ��� �� ������...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...� �� ����, ��� ��� ���-�� �������...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...� ������ ��� ����� �� ����...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...��� �������� ������ �����...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...� ����, ��� ��� ����� ���������...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...������ ��� �� ������� ����?..
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...�� ����� ���, ��� ����� �� ��� ������ ��� ������...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...�������, �� ��� ����� �������...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...�� ������ ��� ���������� ��������...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...��������� ���� �� �����, ��������� ��� �������...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...������ ���� ������...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...��� ���� ���� ����������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_14_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_14_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_14_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_14_KASERNE"					;//��� �������.
	HAFEN						= "SVM_14_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//������!
	Aargh_1						= "SVM_14_Aargh_1"					;//������!
	Aargh_2						= "SVM_14_Aargh_2"					;//������!
	Aargh_3						= "SVM_14_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//���� ������ �������� �� ���� �������. ������ ����, �� ���-�� ���������. ������ ���� � �����.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//���� �� ������, ����� � � ����� �������, ���� ������� ������ ���� �������.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//������� ���, ��� �� � �����, � �� ����� � ���� ���������. �����, �����������.
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//���� ������ �� ������������� ������ ������. ����� � �����������.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//� ���� ���� ��� ��������. ���� ������!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//����, ���������.
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//����, �����.
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//��, ��!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//��, ��!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//��!
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//��!
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//������� �������!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//�� ����������.
	PickBroke				= 	"SVM_15_PickBroke"					;//��, �������.
	NeedKey					= 	"SVM_15_NeedKey"					;//����� ��� ����� ���� ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//� ���� ������ ��� ������� ...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//� �� ���� ��������� ����� ��������.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//�� ���������� ���� ����� � ���� ����� ����� ��������!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//��... � ���� ��� ������� ��� �����.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//��� ������� �� ������� ��� ��� ����������� �����!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//����� �� ����������� �������!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//� ������� �� ����� ������� ���� �����!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//� ��� � ��� ������?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//��... ��� ...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//��� ������ ��� ...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//��� ������ ���...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//������ �����...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//������!
	Aargh_2					=	"SVM_15_Aargh_2"					;//������!
	Aargh_3					=	"SVM_15_Aargh_3"					;//������!
	Dead					=	"SVM_15_Dead"						;//������!
	Awake					=	"SVM_15_Awake"						;//(�����������)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//���. ��� ��� �� ��� �����������. ��������� ������. ���. ����� ��������� ����, ��� ����������� �������.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//�����, ����� ��� ���� ������ � ������ ���� ������.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//�����, ����� ��� ���� ������ � ��� ����� ... ��� ���. �������, ��� ���� ��������� ���.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//����� �������! ��. ����� ���������. ��� ������ ����� ������ � ����.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//����� ���� �����! ��������!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//����� �������� �����.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//������ ��� ������.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//������ ���, ��� � ���� ����.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//���.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//���. �������, � ���-��� �����.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//� �� �������...
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//� �� ���� ����� ��������!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//�������!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//����-����!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//������� �����!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(�������) �, ����. ���...
	HUI						=	"SVM_15_Addon_HUI"						;//��-��-��!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//��� �� ������ � ��������� �� ��������?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//�� ������ ��������� �� ��������...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//� ���� ���� ����������.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//� ��� ���� �����, ����� ��������� ������ ��������.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//�� ����� � �����.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//������� �����! ����� �� ���, ����������, ������� ������������ ����� ������!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//��-�... �������, ����� ��� �� ��������.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//��� ��� ������� ����� � ������ ������?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//���. ������� ����� ��������. ������, ���� ������ ����������� ����� ������.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//����-���� �������!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_16_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_16_Weather"						;//����� ������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//� ���-���� ������� ����!
	DieEnemy					=	"SVM_16_DieEnemy"					;//������ �� ��������!
	DieMonster					=	"SVM_16_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_16_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_16_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_16_SheepKiller"					;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_16_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//������ � �������� ���� ������!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//��� ���� ����� ����, �?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//�������, �������?!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_16_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//� �������, ����� ���� ���� �������� �� ����� �����!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_16_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//� ������, �������� ������!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//�� ������ ����!
	RunAway						= 	"SVM_16_RunAway"						;//� ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//�������!
	Guards						=	"SVM_16_Guards"					;//������!
	Help						=	"SVM_16_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//�������!
	GoodKill					= 	"SVM_16_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//�������� ����������! ����!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//��� ���� ����� �����!? �����!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//��, ���������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(�����������) � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//�� ��, �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//������! ��� ���, � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//���� ��� ��� ����?
	StopMagic					=	"SVM_16_StopMagic"				;//�������� ��� ���������� ������!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//�������� ����������!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_16_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(��� ����) �� ��� ���������...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(��� ����) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(��������) �-��, �����!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(����������� ����) �� ������� ���, ��� ����� �������!
	NotBad						= 	"SVM_16_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(�� ����) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//���� ���!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//������ ���, ��� ���� ������!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//��, ����� ���!
	Ooh01						=	"SVM_16_Ooh01"					;//����������!
	Ooh02						=	"SVM_16_Ooh02"					;//���������!
	Ooh03						=	"SVM_16_Ooh03"					;//��! ���, ��������, ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(��� ����, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_16_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//�������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//�������, �� ����� � �� � ��� ������.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//��� ������.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//�� ������ ����� ����! ��������!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//�� ������ ��������, � �� ���� ����� � ����� ������� ���!
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//� �� ������������ � ������ - �����!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//�� �������� ���� ����� ����������. ����� ������ ��� �� ����������!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//�� �������� ����� ���������� ��������� ������! ���� ����� ��������� �� ���� ����������!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//���� ����� ������ � ���, ��� �� ������!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//�� ����������� ��� ����. ��� � ���� ������� � �������.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//�� ������ � ���, ��� �� ������ � ������� ����!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//����������� ������ ��������� �� ���� ����������!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 ������� �����.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...������? ��� ���������...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...� �� ���� � ���...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...��� ��� ������ ��-�������...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...�����, �� ������ ��� �� ����...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...� ������ ��� ����...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...�� ������ �������...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...�� ������ �� ���� ������...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...������ ����� �� �����...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...��� ��� ������?..
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...���� �� � �� ������ ��� ������������ �������...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...���-�� ������ ������ ���...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...� ������� ������...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...��� ��� ������� ��� ����, ������?..
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...��� ������ ��������...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...��� ����� ����������...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...�� ����� �� ��������...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...�� �� ����� ������� ����...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...�� ������� ����� �������...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...��� ������...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...��� �� ���� �����...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...� �� ������ ������ �� �����...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...��� ����� ������ ����...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...�� ��� ������...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...� ������ ��� ��������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_16_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_16_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_16_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_16_KASERNE"					;//��� �������.
	HAFEN						= "SVM_16_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//������!
	Aargh_1						= "SVM_16_Aargh_1"					;//������!
	Aargh_2						= "SVM_16_Aargh_2"					;//������!
	Aargh_3						= "SVM_16_Aargh_3"					;//������!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//������ ���-������ ���������. ��� ������ ��������� ������ ���� � ����� �����.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//������!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//�����!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//�� ������!
	PALGreetings				=	"SVM_17_PALGreetings"				;//�� ������!
	Weather						= 	"SVM_17_Weather"						;//����� ������� ������!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//� ���-���� ������ ����!
	DieEnemy					=	"SVM_17_DieEnemy"					;//������ �� ��������!
	DieMonster					=	"SVM_17_DieMonster"					;//��� ����� ������� ����� ������ �����!
	DirtyThief					=	"SVM_17_DirtyThief"					;//������� �������! ��, �������!
	HandsOff					=	"SVM_17_HandsOff"					;//����� ���� ������� ����!
	SheepKiller					=	"SVM_17_SheepKiller"					;//���� ����� ������ ������� ����� ����!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//���� ������� ������ ������ ����� ����!
	YouMurderer					=	"SVM_17_YouMurderer"					;//������!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//������ ����� �� �����!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//��, �������, ����� ���!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//�� ��� ����������!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//������ � �������� ���� ������!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//��� ���� ����� ����, �?!
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//�� ����������?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//����, �������!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//�������, �������?!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//��� ����� �������� ����� ������!
	ThiefDown					=	"SVM_17_ThiefDown"					;//���� �� ������� �������� � ����!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//� �������, ����� ���� ���� �������� �� ����� �����!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//������� ������ ��� �� �����! ��� ���� ����!
	KillMurderer				=	"SVM_17_KillMurderer"				;//����, ������!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//����� �����!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//���� �� ������� ��������� ������ ������ ����!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//���� ������ ��������� ����!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//� ������ �������� ������!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//� ������ �� ��������� ��� �� �����!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//����� ����� ���������, �������? ����� ��� ����� ���� ������!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//�� ������ ����!
	RunAway						= 	"SVM_17_RunAway"						;//� ����� ������!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//�������!
	Guards						=	"SVM_17_Guards"					;//������!
	Help						=	"SVM_17_Help"					;//��������!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//�������!
	GoodKill					= 	"SVM_17_GoodKill"				;//��, ������ ���� ������, ��� ���� ������!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//������ ���� � �����!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//��������! ����!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//�������� ������!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//��� ���� ����� �����!? �����!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//��, ���������� ������!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//��, ��, ��� ���� ����� �����?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(�����������) � ��� ����?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//������� �� ������, �����!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//�� ��, �������, � ���� ���� ������ � ����� ���!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//� �����, ����� ������� ���� ������.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//������! ��� ���, � �� ��������� �� ����.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//���� ��� ��� ����?
	StopMagic					=	"SVM_17_StopMagic"				;//�������� ��� ���������� ������!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//�������� ����������!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//����� ������!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//�� ������� ��� ������� ������?!
	WiseMove					=	"SVM_17_WiseMove"				;//����� �������!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(���� ��� ���) �� ��� ���������...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(���� ��� ���) ��, ��� ������...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(��������) �-��, �����!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(����������) ��, ��� ���, �����!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(����������� ����) �� ������� ���, ��� ����� �������!
	NotBad						= 	"SVM_17_NotBad"					;//(������������) �������...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(���� ��� ���) ��� ���! ����� ����������...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//����� ���!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//������ ���, ��� ���� ������!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//��, ����� ���!
	Ooh01						=	"SVM_17_Ooh01"					;//����������!
	Ooh02						=	"SVM_17_Ooh02"					;//���������!
	Ooh03						=	"SVM_17_Ooh03"					;//��! ���, ��������, ������!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(��� ����, ����������) ��� ��� ����?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//�������� � ���� �������!
	Awake						= "SVM_17_Awake"					;//(������)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//�������, �� ����� � ������������ � ��� ������.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//�������, �� ����� � ���� ������� � ������� ���� �����.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//�������, �� ����� � �� � ��� ������.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//��� ������.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//�� ������ ����� ����! ��������!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//�� ������ ��������, � �� ���� ����� � ����� ������� ���.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//� �� ������������ � ������ - �����!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//�� �������� ���� ����� ����������. ����� ������ ��� �� ����������!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//�� �������� ����� ���������� ��������� ������! ���� ����� ��������� �� ���� ����������!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//���� ����� ������ � ���, ��� �� ������!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//�� ����������� ��� ����. ��� � ���� ������� � �������.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//�� ������ � ���, ��� �� ������ � ������� ����!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//����������� ������ ��������� �� ���� ����������!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 ������� �����.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 ������� �����.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 ������� �����.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 ������� �����.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 ������� �����.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 ������� �����.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 ������� �����.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 ������� �����.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 ������� �����.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 ������� �����.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 ������� �����.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 ������� �����.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 ������� �����.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 ������� �����.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 ������� �����.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 ������� �����.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 ������� �����.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 ������� �����.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 ������� �����.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 ������� �����.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 ������� �����.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 ������� �����.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 ������� �����.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 ������� �����.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 ������� �����.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 ������� �����.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 ������� �����.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 ������� �����.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...������? ��� ���������...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...� �� ���� � ���...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...��� ��� ������ ��-�������...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...�����, �� ������ ��� �� ����...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...� ������ ��� ����...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...�� ������ �������...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...�� ������ �� ���� ������...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...������ ����� �� �����...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...��� ��� ������?..
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...���� �� � �� ������ ��� ������������ �������...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...���-�� ������ ������ ���...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...� ������� ������...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...��� ��� ������� ��� ����, ������?..
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...��� ������ ��������...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...��� ����� ����������...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...�� ����� �� ��������...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...�� �� ����� ������� ����...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...�� ������� ����� �������...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...��� ������...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...��� �� ���� �����...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...� �� ������ ������ �� �����...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...��� ����� ������ ����...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...�� ��� ������...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...� ������ ��� ��������...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//�����������, ����� � ���� ����� ������ �����.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//���� ����� ������, ��� � � ��������� ������� ����.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//� ������ ������ �� ���� ������� ����. �� ���� ������� �����.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//���������, �� ��� ����� ����...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//������ �� ���������� � ������ ����� ������.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//������ �� ���������� � ������� ����� ������.
	TEMPEL						= "SVM_17_TEMPEL"					;//������ �� ���������� � �����.
	MARKT						= "SVM_17_MARKT"						;//������ �� ���������� �� �������� �������.
	GALGEN						= "SVM_17_GALGEN"					;//������ �� ���������� �� ������� ���������� ����� ���������.
	KASERNE						= "SVM_17_KASERNE"					;//��� �������.
	HAFEN						= "SVM_17_HAFEN"						;//������ �� ���������� � �������� ��������.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//���� �� ������ �������?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//������ ����� ���������� ������, � �� ��������� � ������ ����� ������.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//�� ����� ����� ������ ���������� ��������, ������� � ���������� ��������� �������. ��� � ���������� ������� �������.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//������ ����� ������ � �������, � �� �������� �� �������� �������.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//��� �� ������ �� ������� ����, � �� �������� � ����.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//�� �������� ������� � ������ ����� ������ ����� ������.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//������ ����� � �����, � ����� ��� �����, ����� ��������� �����. ��� �� �������� �� �����.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//����� �� �����, � ������ ���� ������� �����, �� �������� �� ������� ����������.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//������ ����� ������� ��������� ����� �� �����, �� �������� � ����.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//��� �������� ������ - �������. ����� ������� � ���, ������ ��������� �� �������� �� �����.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//������ ������ ���� ������, � �� �������� �� ������� ����������.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//������ �� �������� �� ������� ����������, � �� �������� �� �������� �������.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//������ ������ ���� ������, � �� �������� �� �������� �������.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//��� �������� ������ - �������. ������ ��������� �� ��������.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//������ �������� �� �������� ����� �� �������� �����, � �� �������� �� �������� �������.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//������ �������� �� �������� ������ �� �������� �����, � �� �������� �� ������� ����������.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//��� ����� �� ������ �� ������, � �� �������� � ������ ����� ������.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//������!
	Aargh_1						= "SVM_17_Aargh_1"					;//������!
	Aargh_2						= "SVM_17_Aargh_2"					;//������!
	Aargh_3						= "SVM_17_Aargh_3"					;//������!
	
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(�����) ��� ��!
	RunCoward    	= "SVM_19_RunCoward"    	;//(�����) �� �� ���� ���������!
	Dead      		= "SVM_19_Dead"      	;//������!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//������!
	Aargh_2      	= "SVM_19_Aargh_2"     	;//������!
	Aargh_3      	= "SVM_19_Aargh_3"     	;//������!
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




