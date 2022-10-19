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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_1_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//Tak jsem t� p�ece jen dostal!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Proto jsi tady!
	DieMonster					=	"SVM_1_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_1_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Tak to t� odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//Tak co jsi tam teda d�lal, no?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Tak p�estane� s t�m u�!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//Trochu velk� sousto, co, ty b��dile!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_1_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�? Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_1_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//POPLACH!
	Guards						=	"SVM_1_Guards"						;//STR��E!
	Help						=	"SVM_1_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_1_GoodKill"					;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(hlasit� k�i��) Hej, st�j, ty �pinav�e!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro za��tek.
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Ten mizera u sebe nem� ��dn� zlato.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(varovn�) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(agresivn�) Je�t� nem� dost?
	StopMagic					=	"SVM_1_StopMagic"					;//Nep�ibli�uj se ke mn� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//P�esta� s tou magi�! M� snad n�co s u�ima!?
	WeaponDown					=	"SVM_1_WeaponDown"					;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Se� snad hluchej, nebo co? �ekl jsem: Dej pry� tu zbra�!
	WiseMove					=	"SVM_1_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(pro sebe) Je�t� se uvid�.
	OhMyHead					=	"SVM_1_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(dychtiv�) Kone�n� se n�co d�je!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(vystra�en�) Vyml�t� si navz�jem mozky z hlavy.
	GoodVictory					=	"SVM_1_GoodVictory"					;//(zl� sm�ch) Koledoval si o to!
	NotBad						= 	"SVM_1_NotBad"						;//(souhlasn�) To nebylo v�bec �patn�.
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(pro sebe) Takov� surovec...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Tak na co �ek�?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//V�born�!
	Ooh01						=	"SVM_1_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_1_Ooh02"						;//Uka� mu, kdo je tady ��f!
	Ooh03						=	"SVM_1_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Vypadni z m� postele!
	Awake						= "SVM_1_Awake"							;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Sly�el jsem, �e jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Sly�el jsem, �e jsi za�el za otcem Parlanem a vyzpov�dal ses mu ze sv�ch h��ch�.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//��k� se, �e jsi za�el za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Takhle vra�dit na�e ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//S mizernejma gr�zlama se nebav�m!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Jdi mi z o��, ty �pinavej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Jsi ostudou sv�ho ��du! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Jsi ostudou m�stsk�ch str��! Lord Andre t� je�t� nau�� zp�sob�m!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre se dozv� o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Otec Parlan nebude nad�en�, a� usly�� o tv�ch h���ch!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Lee ti d� co proto! Je�t� uvid�, co sis nadrobil!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Velitel Garond po tob� bude cht�t vysv�tlen�!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//Tak dobr�, dobr�, vyhr�l jsi. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(nafoukan�) M�m ti znovu uk�zat, kdo je tady p�nem?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 zlat�ch.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 zlat�ch.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 zlat�ch.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 zlat�ch.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 zlat�ch.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 zlat�ch.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 zlat�ch.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 zlat�ch.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 zlat�ch.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 zlat�ch.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 zlat�ch.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 zlat�ch.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 zlat�ch.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 zlat�ch.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 zlat�ch.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 zlat�ch.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 zlat�ch.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 zlat�ch.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 zlat�ch.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 zlat�ch.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 zlat�ch.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 zlat�ch.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 zlat�ch.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 zlat�ch.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 zlat�ch.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 zlat�ch.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 zlat�ch.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...v�n� si mysl�...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...v�echno je mo�n�...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...m�l si to rozmyslet...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...jako bych u� tak nem�l dost probl�m�...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...kdo to �ekl...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...z toho budou jen dal�� probl�my...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...drbalo se tam o v�em mo�n�m...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...nem�l jsem to d�lat...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...to v�echno jsou jen �e�i...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...rad�ji bys m�l zjistit, kdo to ��kal...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...cht�l jsem ti to ��ct d��v...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...nikdo se m� neptal...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...m�l bys m�t soucit s chud�kem...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...to nen� nic nov�ho...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...je to �pln� jasn�...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...nem�l ses m� pt�t, co...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...v�ak v�, co mysl�m...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...je to p�esn� tak, jak jsem ��kal...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...u� to nem��e nic zm�nit...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...pro� mi o tom nikdo ne�ekl d��v...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...po�kejme a uvid�me, co se stane...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...n�kter� probl�my se vy�e�� samy...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...u� o tom nechci nic sly�et...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...za�al p�t...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...v�ichni utekli jak vypla�en� kr�l�ci, z�stal jsem �pln� s�m...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...tak stoj� v P�smu...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...v�dycky jsem konal ve jm�nu Innose...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//... nikdo se nesm� protivit v�li bo��...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_1_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_1_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_1_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_1_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_1_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Kdy� nenos� n� stejnokroj, nebudu se s tebou bavit.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Co to m� na sob�? Oble� se trochu slu�n�!
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Se� voj�k, tak se taky tak obl�kej!
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//N�co takov�ho by �len na�eho ��du nosit nem�l. B� se p�evl�knout.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sob� nem� ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Chc�pni, ty hnusnej bandito!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Ty hajzle pir�tsk�!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_3_Weather"					;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Tak jsem t� p�ece dostal!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Rozsek�m t� na kousky!
	DieMonster					=	"SVM_3_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_3_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Tak ty nep�jde�? Jak chce�!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Cos tam pohled�val?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Zaslou�il sis to, ni�emo!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_3_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�? Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Neubli�uj mi!
	RunAway						= 	"SVM_3_RunAway"					;//A do hajzlu!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//POPLACH!
	Guards						=	"SVM_3_Guards"					;//STR��E!
	Help						=	"SVM_3_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_3_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(k�i��) Jo! Ut�kej, jak nejrychleji m��e�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Je�t� po��d nem� dost?
	StopMagic					=	"SVM_3_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Chce� napr�skat? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_3_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_3_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(nedo�kav�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(zl� sm�ch) Uk�zals mu, kdo je tady p�nem!
	NotBad						= 	"SVM_3_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� krutost...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Tak ho pra��!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Dej to sem v�echno!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Uka� mu!
	Ooh01						=	"SVM_3_Ooh01"					;//Po�kej!
	Ooh02						=	"SVM_3_Ooh02"					;//D�vej pozor!
	Ooh03						=	"SVM_3_Ooh03"					;//J�! To byla trefa!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_3_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Pr� jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Pr� jsi za�el za otcem Parlanem, aby ses vyzpov�dal ze sv�ch h��ch�.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Pr� jsi za�el za Leem a dal ty v�ci do po��dku.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Takhle vra�dit na�e ovce!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Nech m� na pokoji, ty �pinav� zv��e!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Nech m� na pokoji, ty mizernej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Jsi ostudou sv�ho ��du! Po�kej, a� se o tom dozv� lord Hagen!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Jsi ostudou m�stsk�ch str��! Po�kej, a� se o tom dozv� lord Andre!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Po�kej, a� se o tom dozv� lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Po�kej, a� se o tom dozv� otec Parlan!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Po�kej, a� se to donese Leeovi...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Po�kej, a� se o tom dozv� velitel Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Dobr�, dobr�, jsi lep�� bojovn�k ne� j�. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(arogantn�) M�m dojem, �e u� ti mus� b�t jasn�, kdo je tady ten siln�j��... Co chce�?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//M�l jsem dojem, �e ses na m� pokou�el vyt�hnout zbra�. To sis to rozmyslel? Ty sp� d�v� p�ednost ROZHOVORU, co? (sm�ch)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 zlat�ch.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...v�n� si mysl�...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...v�echno je mo�n�...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...m�l si to rozmyslet...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...jako bych nem�l dost probl�m�...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...kdo ti to �ekl...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...z toho budou jen dal�� probl�my...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...drbalo se tam o v�em mo�n�m...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...nem�l jsem na to nikdy ani pomyslet...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...to v�echno jsou jen �e�i...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...bude lep�� zjistit, kdo ti �ekl, �e...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...cht�l jsem ti to ��ct d��v...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...nikdo se m� neptal...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...m�l bys m�t soucit s chud�kem...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...to nen� nic nov�ho...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...je to �pln� jasn�...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...nem�l ses m� pt�t, co...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...v�ak v�, co mysl�m...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...je to p�esn� tak, jak jsem ��kal...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...u� to nem��e nic zm�nit...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...pro� mi o tom nikdo ne�ekl d��v...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...po�kejme a uvid�me, co se stane...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...n�kter� probl�my se vy�e�� samy...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...u� o tom nechci nic sly�et...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...za�al p�t...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...v�ichni utekli jak vypla�en� kr�l�ci, z�stal jsem �pln� s�m...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...tak stoj� v P�smu...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...v�dycky jsem konal ve jm�nu Innose...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...nikdo se nesm� protivit v�li boh�...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_3_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_3_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_3_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_3_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_3_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Co to m� na sob�? V�bec se to k tob� nehod�. Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Jestli si chce� promluvit, tak se nap�ed po��dn� oble�.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//My voj�ci nos�me sv�j stejnokroj s hrdost�. B� se p�evl�ct.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//V na�em ��du plat�, �e se v�ichni obl�k�me stejn�. Tak se koukej p�evl�ci!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Ty jsi snad pr�v� vylezl z lochu. Nap�ed si se�e� n�co na sebe!

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//POCEM, TY ZATRACENEJ BANDITO!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//POCEM, TY ZATRACENEJ PIR�TE!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_4_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//U� zase TY!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Rozsek�m t� na kousky!
	DieMonster					=	"SVM_4_DieMonster"					;//Dal�� z t�ch v�c�!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ty mizernej zlod�ji!
	HandsOff					=	"SVM_4_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hej! Nech na�e ovce na pokoji!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Ta obluda vra�d� na�e ovce!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//Co tam ta bestie prov�d�?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//S�m sis o to �ekl!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//�ekl sis o to.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//M�m dojem, �e by n�kter�m lidem neu�kodilo, kdyby poznali, za� je toho loket.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Co tam d�l�, co!?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Tak p�estane� s t�m u�!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Chc�pni!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Takovej blbej bastard...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//Dobr�, to na tebe bylo trochu moc, co, ty mizern� bestie!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Okam�it� dej ty sv� �pinav� pracky pry� z mejch v�c�, jasn�?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Hl�dej si ty svoje ukopt�n� prsty!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Okam�it� dej ty svoje umoun�n� pracky pry� od na�ich ovc�!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Tohle u� nikdy nezkou�ej, k�mo!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Douf�m, �e sis z toho vzal ponau�en�.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Vst�vej a vypadni odsud!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//A� u� t� tu nikdy nevid�m - jasn�?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//J� jsem ten, kdo tady rozd�v� r�ny, rozum�?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_4_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//POPLACH!
	Guards						=	"SVM_4_Guards"					;//STR��E!
	Help						=	"SVM_4_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(vol�) Jo! Takhle se na to mus�!
	GoodKill					= 	"SVM_4_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(k�i��) Je�t� se uvid�me!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Ven!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Co tady chce�?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Jen mu nandej!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Co tady kolem �much�?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(vst�v�) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(agresivn�) Koleduje� si!
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Chce� napr�skat? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_4_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_4_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(dychtiv�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(zl� sm�ch) Uk�zals mu, kdo je tady p�nem!
	NotBad						= 	"SVM_4_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� krutost...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Jo, nandej mu to!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Uka� mu!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_4_Ooh01"					;//Bra� se!
	Ooh02						=	"SVM_4_Ooh02"					;//Pokra�uj, vra� mu to!
	Ooh03						=	"SVM_4_Ooh03"					;//Au! Takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(pro sebe, vst�v�) Sakra, co zas bylo TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Vypadni z m� postele!
	Awake						= "SVM_4_Awake"						;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Tak velitel dal ty v�ci do po��dku.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Tak ty jsi u�inil pok�n� u otce Parlana...
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Sly�el jsem, �e Lee dal ty v�ci do po��dku.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Dobr�.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Vra�d�n� ovc� u� bylo dost! Ztra� se!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Jsi gr�zl - ztra� se!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Zatracenej zlod�ji! U� t� m�m pr�v� tak dost!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Od paladina bych o�ek�val n�co jin�ho! To se nebude lordu Hagenovi l�bit.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Jak se n�kdo jako ty mohl dostat k m�stsk�m str��m? Lord Andre ti to je�t� spo��t�!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre se o tv�m chov�n� dozv�!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Otec Parlan nebude m�t z tv�ho po��n�n� ��dnou radost!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Lee to nenech� jen tak!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Velitel Garond nebude m�t radost, a� to usly�� - za to zaplat�!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//M� docela s�lu... co �es to cht�l?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(dom��liv�) N�jak� dal�� ot�zky?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//U� zase TY!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 zlat�ch.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...v�n� je to tak...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...to nen� to, co jsem sly�el...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...ne��kej mi, �es o tom nev�d�l...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...v tyhle dny ani nev�, komu m� v��it...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...v�echno to jsou jen drby...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...nejsem o nic ��astn�j��...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...u� m� nem��e nic p�ekvapit...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...to v�n� nen� m�j probl�m...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...opravdu si mysl�, �e...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...nikdo se ode m� nic nedozv�...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...v�em to bylo jasn�...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...naslouchal �patn�m lidem...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...pokud to s�m nevid�, nem��u mu nijak pomoct...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...ne��k�m ti nic nov�ho...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...nikdy by na to s�m nep�i�el...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...to u� se v� dlouho...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...to je �patn� obchod...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...m�l jsem to ud�lat jinak...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...�pln� s tebou souhlas�m...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...to nic nezm�n�...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...nikdy by m� nenapadlo, �e...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...u� s t�m nic nenad�l�...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...to m� nep�ekvapuje...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...ale to ne, on v�d�l v�echno nejl�p...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...situace je v�n�, tak mi ne��kej, �e...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...je�t� ani nev�d�l, jak po��dn� dr�et me�...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...jo, v�n� �ekl, �e...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...za tohle n�kdo zaplat�...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos nenech� v nev�domosti nikoho, kdo rozpozn� jeho moudrost...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...spravedlnost nakonec zv�t�z�...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//U� t� nem��u nau�it nic dal��ho. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_4_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_4_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_4_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_4_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_4_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Nap�ed se slu�n� oble� a pak si promluv�me.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Nap�ed si obl�kni zbroj, jinak se s tebou nebudu bavit.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Copak ti nikdo nedal na�i zbroj? No tak si ji oble�!
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Kde m� roucho? B� se p�evl�ct, jinak se s tebou nebudu bavit.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Co jsi to za chud�ka? Vra� se, a� si bude� moct dovolit aspo� zbroj!

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Dal�� bandita!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Ty �pinavej pir�te!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_5_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//Tak jsem t� p�ece jen dostal!
	DieEnemy					=	"SVM_5_DieEnemy"					;//S�m sis o to �ekl!
	DieMonster					=	"SVM_5_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_5_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Tak to t� odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Tak co jsi tam teda d�lal, no?!
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Trochu velk� sousto, co, ty b��dile!
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_5_ThiefDown"					;//U� se nikdy nepokou�ej m� okr�st!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�? Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_5_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//POPLACH!
	Guards						=	"SVM_5_Guards"						;//STR��E!
	Help						=	"SVM_5_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_5_GoodKill"					;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(hlasit� k�i��) Hej, st�j, ty �pinav�e!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro za��tek.
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Ty u sebe nem� ��dn� zlato?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(varovn�) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(agresivn�) Je�t� nem� dost?
	StopMagic					=	"SVM_5_StopMagic"					;//Nep�ibli�uj se ke mn� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//P�esta� s tou magi�! M� snad n�co s u�ima!?
	WeaponDown					=	"SVM_5_WeaponDown"					;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Se� snad hluchej, nebo co? �ekl jsem: Dej pry� tu zbra�!
	WiseMove					=	"SVM_5_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(pro sebe) Je�t� se uvid�.
	OhMyHead					=	"SVM_5_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(dychtiv�) Kone�n� se n�co d�je!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(vystra�en�) Ale v�dy� si navz�jem vytlu�ou mozek z hlavy.
	GoodVictory					=	"SVM_5_GoodVictory"					;//(zl� sm�ch) Koledoval si o to!
	NotBad						= 	"SVM_5_NotBad"						;//(souhlasn�) To nebylo v�bec �patn�.
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(pro sebe) Takov� surovec...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Tak na co �ek�?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//V�born�!
	Ooh01						=	"SVM_5_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_5_Ooh02"						;//Uka� mu, kdo je tady ��f!
	Ooh03						=	"SVM_5_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Vypadni z m� postele!
	Awake						= "SVM_5_Awake"							;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Sly�el jsem, �e jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Sly�el jsem, �e jsi za�el za otcem Parlanem a u�inil pok�n�.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//Sly�el jsem, �e jsi za�el za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Takhle vra�dit na�e ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//S mizernejma gr�zlama se nebavim!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Jdi mi z o��, ty �pinavej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Jsi ostudou sv�ho ��du! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Jsi ostudou m�stsk�ch str��! Lord Andre t� je�t� nau�� zp�sob�m!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre se dozv� o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Otec Parlan nebude nad�en�, a� usly�� o tv�ch h���ch!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee ti d� co proto! Je�t� uvid�, co sis nadrobil!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Velitel Garond po tob� bude cht�t vysv�tlen�!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//Tak dobr�, dobr�, vyhr�l jsi. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(nafoukan�) M�m ti znovu uk�zat, kdo je tady p�nem?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 zlat�ch.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 zlat�ch.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 zlat�ch.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 zlat�ch.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 zlat�ch.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 zlat�ch.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 zlat�ch.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 zlat�ch.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 zlat�ch.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 zlat�ch.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 zlat�ch.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 zlat�ch.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 zlat�ch.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 zlat�ch.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 zlat�ch.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 zlat�ch.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 zlat�ch.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 zlat�ch.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 zlat�ch.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 zlat�ch.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 zlat�ch.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 zlat�ch.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 zlat�ch.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 zlat�ch.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 zlat�ch.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 zlat�ch.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 zlat�ch.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...v�n� si mysl�...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...v�echno je mo�n�...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...m�l si to rozmyslet...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...jako bych nem�l dost probl�m�...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...kdo ti to �ekl...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...z toho budou jen dal�� probl�my...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...drbalo se tam o v�em mo�n�m...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...nem�l jsem to d�lat...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...to v�echno jsou jen �e�i...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...rad�ji bys m�l zjistit, kdo to ��kal...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...cht�l jsem ti to ��ct d��v...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...nikdo se m� neptal...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...m�l bys m�t soucit s chud�kem...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...to nen� nic nov�ho...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...je to �pln� jasn�...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...nem�l ses m� pt�t, co...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...v�ak v�, co mysl�m...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...je to p�esn� tak, jak jsem ��kal...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...u� to nem��e nic zm�nit...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...pro� mi o tom nikdo ne�ekl d��v...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...po�kejme a uvid�me, co se stane...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...n�kter� probl�my se vy�e�� samy...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...u� o tom nechci nic sly�et...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...za�al p�t...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...v�ichni utekli jak vypla�en� kr�l�ci, z�stal jsem �pln� s�m...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...tak stoj� v P�smu...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...v�dycky jsem konal ve jm�nu Innose...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...nikdo se nesm� protivit v�li boh�...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_5_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_5_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_5_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_5_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_5_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Nap�ed si na sebe vem n�co slu�n�ho.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//Co to m� na sob�? To u� k n�m jako nepat��? Pak s tebou taky nechci nic m�t.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//My voj�ci bojujeme ve jm�nu kr�le, tak bys m�l taky nosit jeho zbroj!
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Na� ti n� ��d v�noval roucho, kdy� je nenos�? Pop�em��lej o tom.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Co jsi to za chud�ka? To nem� ��dn� brn�n�? B� pry�.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//�, bandita.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Rozsek�m t� na kous��ky, pir�te pir�tsk�!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_6_Weather"					;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Dostanu t�!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Nem�l jsi sem chodit!
	DieMonster					=	"SVM_6_DieMonster"					;//Poj� sem, ty zatracen� bestie!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_6_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Nech na�e ovce na pokoji!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//T�hni od na�ich ovc�, ty zv��e!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Toho bude� litovat!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Jako bych t� nevaroval.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hej, VYPADNI!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hej! Co tam chce�?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//P�esta�! Hned!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Nezbude z tebe ani mastnej flek, ty bastarde!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//To na tebe bylo trochu moc.
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Hej, Po��d to je�t� m�m!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Varuju t�! U� to znovu nezkou�ej, ty mizernej zlod�ji!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//A u� se k na�im ovc�m nep�ibli�uj!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Neopova�uj se na m� znovu za�to�it!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Jako bych t� nevaroval.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//U� t� tam nikdy nechci vid�t, jasn�?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Tady se ��dn� rva�ky nestrp�, jasn�?! Douf�m, �e sis z toho vzal ponau�en�.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Nezkou�ej ��dn� legr�cky!
	RunAway						= 	"SVM_6_RunAway"						;//Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//POPLACH!
	Guards						=	"SVM_6_Guards"					;//STR��E!
	Help						=	"SVM_6_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(vol�) Po�li ty bestie do v��n�ch lovi��!
	GoodKill					= 	"SVM_6_GoodKill"				;//(vol�) Jo, dej t�m bastard�m co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(hlasit� k�i��) Je�t� t� dostanu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Nem� tady co pohled�vat!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Jo, vypadni!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Co m� za lubem? Co m� znamenat v�echno to �much�n� kolem?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(vst�v�) Sakra, co chce�?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Dobr�, kdy� u� nic jin�ho, alespo� m� u sebe n�jak� zlato.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Ani zla��k - hmpf.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Asi si vezmu tvoji zbra�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(varovn�) Tak tohle u�, hochu, v�ckr�t ned�lej!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(agresivn�) Pot�ebuje� je�t� dal�� v�prask?
	StopMagic					=	"SVM_6_StopMagic"				;//P�esta� s t�mi kouzly!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Posledn� varov�n�! P�esta� s t�mi kouzly!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Dej tu zbra� pry�!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Schovej tu zbra�, nebo v tom se� a� po u�i!
	WiseMove					=	"SVM_6_WiseMove"				;//Hej, ty nejsi tak blbej, jak vypad�!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(pro sebe) Tohle u� znovu nezkou�ej.
	OhMyHead					=	"SVM_6_OhMyHead"				;//(pro sebe) �! Moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(dychtiv�) A� je kone�n� n�jak� z�bava.
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(vyd�en�) �, m�j bo�e...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(zl� sm�ch) A� si z toho vezme ponau�en�.
	NotBad						= 	"SVM_6_NotBad"					;//(souhlasn�) To byla trefa!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(pro sebe) Takov� surovec!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Dej mu!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Te� nep�est�vej!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_6_Ooh01"					;//D�vej pozor!
	Ooh02						=	"SVM_6_Ooh02"					;//Tak mu to vra�!
	Ooh03						=	"SVM_6_Ooh03"					;//Do hajzlu, takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_6_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Tak velitel dal ty v�ci do po��dku.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Tak t� otec Parlan zbavil viny.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Tak jsi za�el za Leem a vy�e�il situaci.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Dobr�.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Ty vra�d� ovce? P�edpokl�d�m, �e se ti nepoda�ilo naj�t nikoho bezbrann�j��ho?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//S odpornejma banditama nechci nic m�t!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Se zlod�ji nechci m�t nic spole�n�ho!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//A ty se chce� st�t paladinem? Po�kej, dokud ti lord Hagen ne�ekne, co si o tom mysl�!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//V�n� se chce� st�t �lenem m�stsk�ch str��? Lord Andre t� v tom nehodl� podpo�it!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Zajdi za lordem Andrem, dokud m��e�.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Zajdi za otcem Parlanem. Pom��e ti od�init tv� h��chy!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee se o tom dozv� a ty za to zaplat�.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Velitel Garond z toho nebude nad�en�. Ud�l� l�p, kdy� mu o tom �ekne� d��v, ne� se situace je�t� zhor��!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Dobr�, vyhr�l jsi. Tak co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(arogantn�) M�m dojem, �e u� jsi pochopil, s k�m m� tu �est. Co chce�?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Zase ty? Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 zlat�ch.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...nem��u uv��it, �e...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...nebyl bych si tak jist�...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...ale on v�, �e v�ichni...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...st�� v�m, komu v��it...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...nev�m, co ho tak rozru�ilo...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...u� tak jsem v po��dn� brynd�...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...zaslechl jsem jednu, dv� zv�sti...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...nezaj�m� m�, �e...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...nesm� v��it v�emu, co sly��...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...to nem� ode m�...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...u� jsem o tom dost p�em��lel...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...nikdo se m� neptal na n�zor...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...v�n� si nezaslou�il, aby...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...ne��kej, �es nev�d�l, �e...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...bylo to docela jasn�...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...tak kde jsi k tomu teda p�i�el...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...m�m na to sv�j vlastn� n�zor...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...bylo to p�esn� tak, jak jsi ��kal...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...nev���m tomu, �e by se to mohlo zm�nit...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...to je poprv�, co o tom sly��m...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...prost� po�k�me a uvid�me...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...v�d�l jsem, �e n�s �ekaj� probl�my...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...tak pro� m� neposlouchal...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...b�el, jako by mu byl v pat�ch samotn� Beliar...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...jasn� �e jsme nakonec dostali...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...m�l bys do toho zas�hnout a situaci vy�e�it...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...jeden nikdy nev�, jak podl� mohou b�t...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...proto�e je to v�le Innosova...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...jeho skutky byly jen...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_6_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_6_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_6_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_6_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_6_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//V�dy� vypad� jako ka�par. Obl�kni si n�co slu�n�ho!
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//V�bec t� nepozn�v�m. T�hni a vra� se, a� se p�evl�kne�.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Voj�ne, co to m� na sob�? Okam�it� se p�evle�, tady a te�!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Innosova slu�ebn�ka mus� ka�d� zd�lky poznat. Tak�e si b� obl�ci roucho.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Chod� tu v hadrech jak oby�ejnej kop��. Koukej si n�co obl�ct.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Tak te� jsi k�pl na toho neprav�ho, BANDITO!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Vra� se zp�tky na mo�e, PIR�TE!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_7_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//U� zase TY!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Rozsek�m t� na kousky!
	DieMonster					=	"SVM_7_DieMonster"					;//Dal�� z t�ch v�c�!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty mizernej zlod�ji!
	HandsOff					=	"SVM_7_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hej! Nech na�e ovce na pokoji!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Ta obluda vra�d� na�e ovce!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//Co tam ta bestie prov�d�?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//S�m sis o to �ekl!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//�ekl sis o to.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//M�m dojem, �e by n�kter�m lidem neu�kodilo, kdyby poznali, za� je toho loket.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Co tam d�l�, co!?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Tak p�estane� s t�m u�!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Chc�pni!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Takovej blbej bastard...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Dobr�, to na tebe bylo trochu moc, co, ty mizern� bestie!
	ThiefDown					=	"SVM_7_ThiefDown"					;//Okam�it� dej ty sv� �pinav� pracky pry� z mejch v�c�, jasn�?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Hl�dej si ty svoje ukopt�n� prsty!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Okam�it� dej ty svoje umoun�n� pracky pry� od na�ich ovc�!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//U� to v�ckr�t nezkou�ej, hochu!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Douf�m, �e sis z toho vzal ponau�en�.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Vst�vej a vypadni odsud!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//A� u� t� tu nikdy nevid�m - jasn�?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//J� jsem ten, kdo tady rozd�v� r�ny, rozum�?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_7_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//POPLACH!
	Guards						=	"SVM_7_Guards"					;//STR��E!
	Help						=	"SVM_7_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(vol�) Jo! Takhle se na to mus�!
	GoodKill					= 	"SVM_7_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(k�i��) Je�t� se uvid�me!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Ven!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Co tady chce�?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Jen mu nandej!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Co tady kolem �much�?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(vst�v�) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(agresivn�) Koleduje� si!
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Chce� napr�skat? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_7_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_7_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(dychtiv�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(zl� sm�ch) Uk�zals mu, kdo je tady p�nem!
	NotBad						= 	"SVM_7_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� krutost...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Jo, nandej mu to!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Uka� mu!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Jen mu to nandej!
	Ooh01						=	"SVM_7_Ooh01"					;//Bra� se!
	Ooh02						=	"SVM_7_Ooh02"					;//Pokra�uj, vra� mu to!
	Ooh03						=	"SVM_7_Ooh03"					;//Au! Takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(pro sebe, vst�v�) Sakra, co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Vypadni z m� postele!
	Awake						= "SVM_7_Awake"						;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Tak velitel dal ty v�ci do po��dku.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Tak jsi u�inil pok�n� u otce Parlana.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Sly�el jsem, �e Lee dal ty v�ci do po��dku.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Dobr�.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Vra�d�n� ovc� u� bylo dost! Ztra� se!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Jsi gr�zl - ztra� se!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Zatracenej zlod�ji! U� t� m�m pr�v� tak dost!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Od paladina bych o�ek�val n�co jin�ho! To se nebude lordu Hagenovi l�bit.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Jak se n�kdo jako ty mohl dostat k m�stsk�m str��m? Lord Andre ti to je�t� spo��t�!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre se o tv�m chov�n� dozv�!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Otec Parlan nebude m�t z tv�ho po��n�n� ��dnou radost!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee to nenech� jen tak!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Velitel Garond nebude m�t radost, a� to usly�� - za to zaplat�!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//M� docela s�lu... co �es to cht�l?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(dom��liv�) N�jak� dal�� ot�zky?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//U� zase TY!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 zlat�ch.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...v�n� je to tak...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...to nen� to, co jsem sly�el...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...ne��kej mi, �es o tom nev�d�l...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...v tyhle dny ani nev�, komu m� v��it...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...v�echno to jsou jen drby...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...nejsem o nic ��astn�j��...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...u� m� nem��e nic p�ekvapit...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...to v�n� nen� m�j probl�m...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...opravdu si mysl�, �e...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...nikdo se ode m� nic nedozv�...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...v�em to bylo jasn�...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...naslouchal �patn�m lidem...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...pokud to s�m nevid�, nem��u mu nijak pomoct...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...ne��k�m ti nic nov�ho...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...nikdy by na to s�m nep�i�el...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...to u� se v� dlouho...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...to je �patn� obchod...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...m�l jsem to ud�lat jinak...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...�pln� s tebou souhlas�m...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...nic nezm�n�...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...nikdy by m� nenapadlo, �e...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...nen� nic, co s t�m mohl d�lat...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...to m� nijak nep�ekvapuje...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...ale to ne, on v�d�l v�echno nejl�p...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...situace je v�n�, tak mi ne��kej, �e...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...je�t� ani nev�d�l, jak po��dn� dr�et me�...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...jo, v�n� �ekl, �e...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...za tohle bude muset n�kdo zaplatit...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos nenech� v nev�domosti nikoho, kdo rozpozn� jeho moudrost...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...spravedlnost nakonec zv�t�z�...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//U� t� nem��u nau�it nic dal��ho. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_7_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_7_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_7_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_7_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_7_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Na� ten p�evlek? Takhle se s tebou bavit nebudu.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//Co to m� na sob�? Obl�kni si p�ece zbroj!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//To je poru�en� p�edpis� o vojensk�m stejnokroji! Okam�it� se p�evle�, tady a te�!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Rad�i si obl�kni roucho. Dokud to neud�l�, nic ti ne�eknu a rad�i se za tebe budu modlit.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Co chce�? Ty k n�m nepat��, v�dy� na sob� nem� na�i zbroj!

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Zdechni, ty mizernej bandito!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Zdechni, ty hnusnej pir�te!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_8_Weather"					;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Tak jsem t� p�ece dostal!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Rozsek�m t� na kousky!
	DieMonster					=	"SVM_8_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_8_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Tak ty nep�jde�? Jak chce�!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Cos tam pohled�val?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Zaslou�il sis to, ni�emo!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_8_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�?! Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Neubli�uj mi!
	RunAway						= 	"SVM_8_RunAway"					;//A do hajzlu!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//POPLACH!
	Guards						=	"SVM_8_Guards"					;//STR��E!
	Help						=	"SVM_8_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_8_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(k�i��) Jo! Ut�kej, jak nejrychleji m��e�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Je�t� po��d nem� dost?
	StopMagic					=	"SVM_8_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Chce� napr�skat? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_8_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_8_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(nedo�kav�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(zl� sm�ch) Tak jsi mu to uk�zal!
	NotBad						= 	"SVM_8_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� krutost...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Tak ho pra��!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Dej to sem v�echno!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Uka� mu!
	Ooh01						=	"SVM_8_Ooh01"					;//Po�kej!
	Ooh02						=	"SVM_8_Ooh02"					;//D�vej pozor!
	Ooh03						=	"SVM_8_Ooh03"					;//Au! To byla ale trefa!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_8_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Pr� jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Pr� jsi za�el za otcem Parlanem, aby ses vyzpov�dal ze sv�ch h��ch�.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Pr� jsi za�el za Leem a dal ty v�ci do po��dku.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Takhle vra�dit na�e ovce!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Nech m� na pokoji, ty �pinav� zv��e!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Nech m� na pokoji, ty mizernej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Jsi ostudou sv�ho ��du! Po�kej, a� se o tom dozv� lord Hagen!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Jsi ostudou m�stsk�ch str��! Po�kej, a� se o tom dozv� lord Andre!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Po�kej, a� se o tom dozv� lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Po�kej, a� se o tom dozv� otec Parlan!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Po�kej, a� se to donese k Leeovi...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Po�kej, a� se o tom dozv� velitel Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Dobr�, dobr�, jsi lep�� bojovn�k ne� j�. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(arogantn�) M�m dojem, �e u� ti mus� b�t jasn�, kdo je tady ten siln�j��... Co chce�?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//M�l jsem dojem, �e ses na m� pokou�el vyt�hnout zbra�. To sis to rozmyslel? Ty sp� d�v� p�ednost ROZHOVORU, co? (sm�ch)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 zlat�ch.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...v�n� je to tak...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...to nen� to, co jsem sly�el...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...ne��kej mi, �es o tom nev�d�l...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...v tyhle dny ani nev�, komu m� v��it...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...v�echno to jsou jen drby...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...nejsem o nic ��astn�j��...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...u� m� nem��e nic p�ekvapit...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...to v�n� nen� m�j probl�m...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...opravdu si mysl�, �e...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...nikdo se ode m� nic nedozv�...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...v�em to bylo jasn�...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...naslouchal �patn�m lidem...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...pokud to s�m nevid�, nem��u mu nijak pomoct...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...ne��k�m ti nic nov�ho...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...nikdy by na to s�m nep�i�el...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...to u� se v� dlouho...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...to je �patn� obchod...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...m�l jsem to ud�lat jinak...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...�pln� s tebou souhlas�m...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...nic nezm�n�...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...nikdy by m� nenapadlo, �e...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...nen� nic, co s t�m mohl d�lat...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...to m� nijak nep�ekvapuje...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...ale to ne, on v�d�l v�echno nejl�p...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...situace je v�n�, tak mi ne��kej, �e...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...je�t� ani nev�d�l, jak po��dn� dr�et me�...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...jo, v�n� �ekl, �e...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...za tohle bude muset n�kdo zaplatit...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos nenech� v nev�domosti nikoho, kdo rozpozn� jeho moudrost...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...spravedlnost nakonec zv�t�z�...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//U� t� nem��u nau�it nic dal��ho. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_8_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_8_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_8_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_8_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_8_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Nev���m ti. Je na tob� n�co divn�ho, nebo jsi divn� oble�enej.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Ty snad pat�� n�kam jinam, ne? Aspo� podle toho, co m� na sob�. Takhle s tebou nechci nic m�t.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Mus�me trochu vypadat, tak�e si koukej obl�ct zbroj.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos ��d�, abychom st�le hrd� nosili jeho roucho. Tak�e se p�evle�.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//S kop��i se nebav�m. Dyk tu chod� beze zbroje!

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Ty �pinavej bandito!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIR�TI!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_9_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Tak jsem t� p�ece dostal!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Nikdy jsi sem nem�l chodit!
	DieMonster					=	"SVM_9_DieMonster"					;//Poj� sem, ty �pinav�e!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//A dal�� z t�ch �mejd�!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//U� je tu dal�� z t�ch hnusnejch potvor!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_9_HandsOff"					;//Dej ty �pinav� pracky pry�!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Nech na�e ovce na pokoji!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Pakuj se od na�ich ovc�, ty zatracen� zv��e!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Toho bude� litovat!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Varoval jsem t�!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//�ekl jsem VEN!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hej! Co to tam prov�d�?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//P�esta�! Hned te�!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Zap�chnu t�, bastarde!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//Tohle je pro tebe.
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Schei�e!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Tum�, ty hnusn� bestie!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//O dal�� potvoru m��!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Varuju t�! U� to v�ckr�t nezkou�ej, ty mizernej zlod�ji!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//A u� se k na�im ovc�m nep�ibli�uj!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//Ta je ale zatracen� tup� stv�ra!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Neopova�uj se na m� znovu za�to�it!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Varoval jsem t�!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Nechci t� tady u� v�ckr�t vid�t. Je to jasn�?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Nechci tady ��dn� rva�ky, tak na to nezapome�!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Nezkou�ej ��dn� hlouposti!
	RunAway						= 	"SVM_9_RunAway"						;//Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//POPLACH!
	Guards						=	"SVM_9_Guards"					;//STR��E!
	Help						=	"SVM_9_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(vol�) Po�li ty bestie do v��n�ch lovi��!
	GoodKill					= 	"SVM_9_GoodKill"				;//(vol�) Jo, nandej to tomu bastardovi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(k�i��) Dostanu t�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Tady nem� co d�lat!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Jo, vypadni odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Co m� za lubem? Co tady kolem �much�?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(vst�v�) Sakra, co chce�?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Dobr�, kdy� u� nic jin�ho, alespo� m� u sebe n�jak� zlato.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Ani zla��k - hmpf.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Asi si vezmu tvoji zbra�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(varovn�) Tak tohle u�, hochu, v�ckr�t ned�lej!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(agresivn�) Pot�ebuje� dal�� nakl�da�ku?
	StopMagic					=	"SVM_9_StopMagic"				;//P�esta� s t�mi kouzly!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Posledn� varov�n�! P�esta� s t�mi kouzly!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Schovej tu zbra�, nebo v tom se� a� po u�i!
	WiseMove					=	"SVM_9_WiseMove"				;//Hej, ty nejsi tak blbej, jak vypad�!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(pro sebe) Tohle u� nikdy nezkou�ej.
	OhMyHead					=	"SVM_9_OhMyHead"				;//(pro sebe) �! Moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(dychtiv�) A� je kone�n� n�jak� z�bava.
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(vyd�en�) � m�j bo�e...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(zl� sm�ch) A� si z toho vezme ponau�en�.
	NotBad						= 	"SVM_9_NotBad"					;//(souhlasn�) To byla trefa!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(pro sebe) Takov� surovec!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Dej mu!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Te� nep�est�vej!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_9_Ooh01"					;//D�vej pozor!
	Ooh02						=	"SVM_9_Ooh02"					;//Tak mu to vra�!
	Ooh03						=	"SVM_9_Ooh03"					;//Do hajzlu, takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_9_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Tak velitel dal ty v�ci do po��dku.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Tak t� otec Parlan zbavil viny.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Tak ses setkal s Leem a urovnal tu z�le�itost.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Dobr�.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Ty vra�d� ovce? P�edpokl�d�m, �e se ti nepoda�ilo naj�t nikoho bezbrann�j��ho?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//S odpornejma banditama nechci nic m�t!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Se zlod�ji nechci m�t nic spole�n�ho!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//Tak ty se chce� st�t paladinem? Po�kej, a� co na to �ekne lord Hagen!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//V�n� se chce� st�t �lenem m�stsk�ch str��? Lord Andre t� v tom nehodl� podpo�it!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Zajdi za lordem Andrem, dokud m��e�.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Zajdi za otcem Parlanem. Pom��e ti od�init tv� h��chy!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee se o tomhle dozv� a ty za to zaplat�.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Velitel Garond z toho nebude nad�en�. Ud�l� l�p, kdy� mu o tom �ekne� d��v, ne� se situace je�t� zhor��!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Dobr�, vyhr�l jsi. Tak co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(arogantn�) M�m dojem, �e u� ti do�lo, kdo tady m� navrch. Co chce�?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//Zase ty? Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 zlat�ch.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...nem��u tomu uv��it...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...nebyl bych si tak jist�...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...ale on v�, �e v�ichni...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...st�� v�m, komu m�m v��it...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...nev�m, co ho tak rozru�ilo...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...u� tak jsem v po��dn� brynd�...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...zaslechl jsem jednu, dv� zv�sti...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...nezaj�m� m�, �e...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...nesm� v��it v�emu, co sly��...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...to nem� ode m�...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...u� jsem o tom dost p�em��lel...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...nikdo se m� neptal na n�zor...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...v�n� si nezaslou�il, aby...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...ne��kej, �es nev�d�l, �e...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...to bylo jasn�...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...tak kde jsi k tomu teda p�i�el...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...m�m na to sv�j n�zor...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...bylo to p�esn� tak, jak jsi ��kal...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...nev���m tomu, �e by se to mohlo zm�nit...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...to je poprv�, co o tom sly��m...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...m��eme leda �ekat, co se stane...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...v�d�l jsem, �e n�s �ekaj� probl�my...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...tak pro� m� neposlouchal...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...b�el, jako by mu byl v pat�ch samotn� Beliar...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...jasn� �e jsme nakonec dostali...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...m�l bys do toho zas�hnout a situaci vy�e�it...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...jeden nikdy nev�, jak podl� mohou b�t...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...proto�e je to v�le Innosova...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...jeho skutky byly jen...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� m��u nau�it.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Nen� nic, co bych t� mohl je�t� nau�it. ��k p�ed�il sv�ho u�itele.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_9_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_9_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_9_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_9_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_9_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� od kov�rny dostat na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Ty m� ale r�nu! Obl�kni si n�co vhodn�j��ho!
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//Co to m� na sob�? A� u� t� tu vid�m ve zbroji!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Pracuje� pro kr�le, tak koukej nosit jeho zbroj! B� se p�evl�ct!
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Tv� �aty se pro �lena na�eho ��du nehod�. B� se p�evl�ci!
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sob� nem� ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//Jsi na �ad�, bandito!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Sem jsi nem�l chodit, pir�te!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_10_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//U� zase TY!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Rozsek�m t� na kousky!
	DieMonster					=	"SVM_10_DieMonster"					;//Dal�� z t�ch v�c�!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Ty mizernej zlod�ji!
	HandsOff					=	"SVM_10_HandsOff"					;//Dej ty �pinav� pracky pry�!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hej! Nech na�e ovce na pokoji!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Ta obluda vra�d� na�e ovce!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//Co tam ta bestie prov�d�?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//S�m sis o to �ekl!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//�ekl sis o to.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//M�m dojem, �e by n�kter�m lidem neu�kodilo, kdyby poznali trochu tvrdosti.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Co tam d�l�, co!?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Chc�pni!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Takovej blbej bastard...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//Dobr�, to na tebe bylo trochu moc, co, ty mizern� bestie!
	ThiefDown					=	"SVM_10_ThiefDown"					;//P�esta� strkat nos do m�ch v�c� - jasn�?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Hl�dej si ty svoje ukopt�n� prsty!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Okam�it� dej ty svoje umoun�n� pracky pry� od na�ich ovc�!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Chc�pni, ty vrahu!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//Ta je ale zatracen� tup� stv�ra!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Tohle u� v�ckr�t nezkou�ej, k�mo!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Douf�m, �e sis z toho vzal ponau�en�.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Vst�vej a vypadni odsud!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//A� u� t� tu nikdy nevid�m - jasn�?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//J� jsem ten, kdo tady rozd�v� r�ny, rozum�?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_10_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//POPLACH!
	Guards						=	"SVM_10_Guards"					;//STR��E!
	Help						=	"SVM_10_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(vol�) Jo! Takhle se na to mus�!
	GoodKill					= 	"SVM_10_GoodKill"				;//(vol�) To je to, co si ta svin� zaslou��!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(k�i��) Je�t� se uvid�me!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Ven!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Co tady chce�?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Jo, dej mu!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Co tady kolem �much�?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(vst�v�) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Ty mizernej b�d�ku - nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Asi si tuhle zbra� rad�ji vezmu!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(varovn�) Poslouchej! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(agresivn�) Koleduje� si!
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Chce� nakl�da�ku? P�esta� s t�m u�!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Tak dej u� tu zatracenou zbra� pry�!
	WiseMove					=	"SVM_10_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(pro sebe) Uvid�me p��t�.
	OhMyHead					=	"SVM_10_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(nedo�kav�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(zl� sm�ch) Dal jsi jim co proto!
	NotBad						= 	"SVM_10_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� krutost...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Jo, nandej mu to!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Uka� mu!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_10_Ooh01"					;//Bra� se!
	Ooh02						=	"SVM_10_Ooh02"					;//Pokra�uj, vra� mu to!
	Ooh03						=	"SVM_10_Ooh03"					;//Au! Takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(pro sebe, vst�v�) Sakra, co bylo zas TOHLE?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Vypadni z m� postele!
	Awake						= "SVM_10_Awake"						;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Tak velitel dal ty v�ci do po��dku.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Tak jsi u�inil pok�n� u otce Parlana.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Sly�el jsem, �e Lee dal ty v�ci do po��dku.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//To je spravedliv�.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Vra�d�n� ovc� u� bylo dost! Ztra� se!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Jsi gr�zl - ztra� se!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Zatracenej zlod�ji! U� t� m�m pr�v� tak dost!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Od paladina bych o�ek�val n�co jin�ho! To se nebude lordu Hagenovi l�bit.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Jak se n�kdo jako ty mohl dostat k m�stsk�m str��m? Lord Andre ti to je�t� spo��t�!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre se o tv�m chov�n� dozv�!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Otec Parlan nebude m�t z tv�ho po��n�n� ��dnou radost!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Lee to nenech� jen tak!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Velitel Garond nebude m�t radost, a� to usly�� - za to zaplat�!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//M� docela s�lu... co �e jsi to cht�l?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(dom��liv�) N�jak� dal�� ot�zky?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//U� zase TY!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 zlat�ch.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...je mi to jedno...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...nikdo to nechce v�d�t...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...bylo to jeho rozhodnut�, nebo ne...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...��dn� n�vrh, �ekni...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...nem�m s t�m nic spole�n�ho...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...nem�m na takov� v�ci �as...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...nem��u se z toho jen tak vyvl�knout...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...nebude� mi ��kat...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...byl tam, ud�lal to...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...v�ci, o kter�ch ti m��u ��ct...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...na to se nem��e� spol�hat...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...j� to ��kal u� d�vno...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...a je toho v�c, v�� mi...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...n�kter� v�ci se vrac� v pln� m��e...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...�ekni, �e to nen� pravda...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...d��ve �i pozd�ji by k tomu do�lo...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...v�n� o tom m�l v�d�t v�c...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...to u� nic nezm�n�...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...nen� to ��dn� tajemstv�...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...nen� to ��dn� velk� obchod...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...myslel si, �e je to snadn� jak...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...nikdo ve skute�nosti nechce sly�et...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...a to je pravda...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...sta�� poslouchat, co ��kaj�...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...kdyby nebylo n�s, dopadlo by to jinak...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...prost� pot�ebuje v�c zku�enost�...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...co on v� o slu�b�...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Innos vym��� spravedliv� trest...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...cesta poctivosti je dlouh� a trnit�...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...pouze Innos rozhodne, co je spr�vn� a co ne...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_10_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_10_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_10_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_10_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_10_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Co to m� na sob�? V�, jak vypad�? Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Jestli pat�� k n�m, m�l by ses podle toho i obl�kat. Tak si na sebe vem n�co lep��ho!
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Kdy� ti n�kdo d� kr�lovskou zbroj, znamen� to, �e ji m� nosit.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Pokud odm�tne� na�e roucho, odm�t� t�m i Innose. Zamysli se nad t�m.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Pro� bych se m�l bavit s n�k�m, kdo nem� ani na po��dnou zbroj?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Ty odpornej bandito!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Ty hnusnej pir�te!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(vol�) Po�kej!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_11_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Tak jsem t� p�ece jen dostal!
	DieEnemy					=	"SVM_11_DieEnemy"					;//S�m sis o to �ekl!
	DieMonster					=	"SVM_11_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_11_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_11_SheepKiller"					;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Tak to t� odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Tak co jsi tam teda d�lal, no!?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Trochu velk� sousto, co, ty b��dile!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_11_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�? Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_11_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//POPLACH!
	Guards						=	"SVM_11_Guards"						;//STR��E!
	Help						=	"SVM_11_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_11_GoodKill"					;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(hlasit� k�i��) Hej, st�j, ty �pinav�e!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro za��tek.
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Ty u sebe nem� ��dn� zlato?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(varovn�) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(agresivn�) Je�t� nem� dost?
	StopMagic					=	"SVM_11_StopMagic"					;//Nep�ibli�uj se ke mn� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//P�esta� s tou magi�! M� snad n�co s u�ima!?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Se� snad hluchej, nebo co? �ekl jsem: Dej pry� tu zbra�!
	WiseMove					=	"SVM_11_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(pro sebe) Je�t� se uvid�.
	OhMyHead					=	"SVM_11_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(dychtiv�) Kone�n� se n�co d�je!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(vystra�en�) Vyml�t� si navz�jem mozky z hlavy.
	GoodVictory					=	"SVM_11_GoodVictory"					;//(zl� sm�ch) Koledoval si o to!
	NotBad						= 	"SVM_11_NotBad"						;//(souhlasn�) To nebylo v�bec �patn�.
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(pro sebe) Takov� surovec...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Tak na co �ek�?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//V�born�!
	Ooh01						=	"SVM_11_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_11_Ooh02"						;//Uka� mu, kdo je tady ��f!
	Ooh03						=	"SVM_11_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Vypadni z m� postele!
	Awake						= "SVM_11_Awake"							;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Sly�el jsem, �e jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Sly�el jsem, �e jsi za�el za otcem Parlanem a vyzpov�dal ses mu ze sv�ch h��ch�.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//��k� se, �e jsi za�el za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Takhle vra�dit na�e ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//S mizernejma gr�zlama se nebavim!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Jdi mi z o��, ty �pinavej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Jsi ostudou sv�ho ��du! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Jsi ostudou m�stsk�ch str��! Lord Andre t� je�t� nau�� zp�sob�m!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre se dozv� o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Otec Parlan o tom neusly�� r�d!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee ti d� co proto! Je�t� uvid�, co sis nadrobil!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Velitel Garond po tob� bude cht�t vysv�tlen�!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Tak dobr�, dobr�, vyhr�l jsi. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(nafoukan�) M�m ti znovu uk�zat, kdo je tady p�nem?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 zlat�ch.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 zlat�ch.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 zlat�ch.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 zlat�ch.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 zlat�ch.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 zlat�ch.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 zlat�ch.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 zlat�ch.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 zlat�ch.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 zlat�ch.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 zlat�ch.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 zlat�ch.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 zlat�ch.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 zlat�ch.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 zlat�ch.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 zlat�ch.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 zlat�ch.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 zlat�ch.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 zlat�ch.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 zlat�ch.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 zlat�ch.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 zlat�ch.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 zlat�ch.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 zlat�ch.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 zlat�ch.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 zlat�ch.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 zlat�ch.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//...v�n� si mysl�...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//...v�echno je mo�n�...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//...m�l si to rozmyslet...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//...jako bych u� tak nem�l dost probl�m�...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//...kdo ti to �ekl...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//...z toho budou jen dal�� probl�my...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//...drbalo se tam o v�em mo�n�m...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//...nem�l jsem to d�lat...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//...to v�echno jsou jen �e�i...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//...rad�ji bys m�l zjistit, kdo to ��kal...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//...cht�l jsem ti to ��ct d��v...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//...nikdo se m� neptal...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//...m�l bys m�t soucit s chud�kem...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//...to nen� nic nov�ho...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//...je to �pln� jasn�...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//...nem�l ses m� pt�t, co...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//...v�ak v�, co mysl�m...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//...je to p�esn� tak, jak jsem ��kal...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//...to u� nic nezm�n�...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//...pro� mi o tom nikdo ne�ekl d��v...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//...po�kejme a uvid�me, co se stane...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//...n�kter� probl�my se vy�e�� samy...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//...u� o tom nechci nic sly�et...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//...za�al p�t...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//...nechci dopadnout takhle...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//...v�ichni utekli jak vypla�en� kr�l�ci, z�stal jsem �pln� s�m...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//...tak stoj� v P�smu...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//...v�dycky jsem konal ve jm�nu Innose...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//...nikdo se nesm� protivit v�li boh�...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_11_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_11_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_11_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_11_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_11_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Co to m� na sob�? V�bec se k tob� nehod�. Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Jestli se mnou chce� mluvit, tak si laskav� obl�kni zbroj. Tak hejbni kostrou!
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//M� nosit kr�lovskou zbroj. B� pry�.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//N�co takov�ho by �len na�eho ��du nosit nem�l. B� se p�evl�knout.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Dyk na sob� nem� ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Dal�� bandita.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIR�TI!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_12_Weather"					;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Tak jsem t� p�ece dostal!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Nikdy jsi sem nem�l chodit!
	DieMonster					=	"SVM_12_DieMonster"					;//Poj� sem, ty �pinav�e!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_12_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Nech na�e ovce na pokoji!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Pakuj se od na�ich ovc�, ty zatracen� zv��e!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Toho bude� litovat!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Varoval jsem t�!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//�ekl jsem VEN!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hej! Co to tam prov�d�?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//P�esta�! Hned te�!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Zap�chnu t�, bastarde!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Tohle je pro tebe.
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//Tohle svinstvo miluju!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//O dal�� potvoru m��!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Varuju t�! U� to v�ckr�t nezkou�ej, ty mizernej zlod�ji!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//A u� se k na�im ovc�m nep�ibli�uj!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Ta je ale zatracen� tup� stv�ra!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Neopova�uj se na m� znovu za�to�it!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Varoval jsem t�!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//U� t� tady nechci v�ckr�t vid�t, jasn�?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Nechci tady ��dn� rva�ky, tak na to nezapome�!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Nezkou�ej ��dn� hlouposti!
	RunAway						= 	"SVM_12_RunAway"						;//Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//POPLACH!
	Guards						=	"SVM_12_Guards"					;//STR��E!
	Help						=	"SVM_12_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(vol�) Po�li ty bestie do v��n�ch lovi��!
	GoodKill					= 	"SVM_12_GoodKill"				;//(vol�) Jo, nandej to tomu bastardovi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(k�i��) Dostanu t�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Tady nem� co d�lat!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Jo, vypadni odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Co m� za lubem? Co tady kolem �much�?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(vst�v�) Sakra, co chce�?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Dobr�, kdy� u� nic jin�ho, alespo� m� u sebe n�jak� zlato.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Ani zla��k - hmpf.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Asi si vezmu tvoji zbra�.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(varovn�) Tak tohle u�, hochu, v�ckr�t ned�lej!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(agresivn�) Pot�ebuje� dal�� nakl�da�ku?
	StopMagic					=	"SVM_12_StopMagic"				;//P�esta� s t�mi kouzly!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Posledn� varov�n�! P�esta� s t�mi kouzly!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Schovej tu zbra�, nebo v tom se� a� po u�i!
	WiseMove					=	"SVM_12_WiseMove"				;//Hej, ty nejsi tak blbej, jak vypad�!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(pro sebe) Tohle u� nikdy nezkou�ej.
	OhMyHead					=	"SVM_12_OhMyHead"				;//(pro sebe) �! Moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(dychtiv�) A� je kone�n� n�jak� z�bava.
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(vystra�en�) �, m�j bo�e...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(zl� sm�ch) A� si z toho vezme ponau�en�.
	NotBad						= 	"SVM_12_NotBad"					;//(souhlasn�) To byla trefa!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(pro sebe) Takov� surovec!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Dej mu!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Te� nep�est�vej!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Doraz ho!
	Ooh01						=	"SVM_12_Ooh01"					;//D�vej pozor!
	Ooh02						=	"SVM_12_Ooh02"					;//Tak mu to vra�!
	Ooh03						=	"SVM_12_Ooh03"					;//Do hajzlu, takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_12_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Tak velitel dal ty v�ci do po��dku.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Tak t� otec Parlan zbavil viny.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Tak ses setkal s Leem a urovnal tu z�le�itost.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Dobr�.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Ty vra�d� ovce? P�edpokl�d�m, �e se ti nepoda�ilo naj�t nikoho bezbrann�j��ho?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//S odpornejma banditama nechci nic m�t!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Se zlod�ji nechci m�t nic spole�n�ho!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//Tak ty se chce� st�t paladinem? Po�kej, a� co na to �ekne lord Hagen!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//V�n� se chce� st�t �lenem m�stsk�ch str��? Lord Andre t� v tom nehodl� podpo�it!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Zajdi za lordem Andrem, dokud m��e�.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Zajdi za otcem Parlanem. Pom��e ti od�init tv� h��chy!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee se o tomhle dozv� a ty za to zaplat�.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Velitel Garond z toho nebude nad�en�. Ud�l� l�p, kdy� mu o tom �ekne� d��v, ne� se situace je�t� zhor��!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Dobr�, vyhr�l jsi. Tak co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(arogantn�) M�m dojem, �e u� ti do�lo, kdo tady m� navrch. Co chce�?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//Zase ty? Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 zlat�ch.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//...je mi to jedno...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//...nikdo to nechce v�d�t...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//...bylo to jeho rozhodnut�, nebo ne...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//...��dn� n�vrh, �ekni...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//...nem�m s t�m nic spole�n�ho...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//...nem�m na takov� v�ci �as...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//...nem��u se z toho jen tak vyvl�knout...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//...nebude� mi ��kat...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//...byl tam, ud�lal to...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//...v�ci, o kter�ch ti m��u ��ct...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//...na to se nem��e� spol�hat...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//...j� to ��kal u� d�vno...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//...a je toho v�c, v�� mi...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//...n�kter� v�ci se vrac� v pln� m��e...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//...�ekni, �e to nen� pravda...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//...d��ve �i pozd�ji by k tomu do�lo...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//...m�l toho v�d�t v�c...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//...to u� nic nezm�n�...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//...nen� to ��dn� tajemstv�...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//...nen� to ��dn� velk� obchod...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//...myslel si, �e je to snadn� jak...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//...nikdo ve skute�nosti nechce sly�et...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//...a to je pravda...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...prost� poslouchej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//...kdyby nebylo n�s, dopadlo by to jinak...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//...prost� pot�ebuje v�c zku�enost�...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//...co on v� o slu�b�...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//...Innos vym��� spravedliv� trest...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//...cesta poctivosti je dlouh� a trnit�...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//...pouze Innos rozhodne, co je spr�vn� a co ne...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_12_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_12_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_12_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_12_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_12_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Nap�ed se p�evle�, takhle ti to stejn� neslu��.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Jestli se mnou chce� mluvit, obl�kni si zbroj.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Voj�k m� nosit jedin� kr�lovskou zbroj, NIC JIN�HO! Tak se mazej p�evl�knout!
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//N�co takov�ho by �len na�eho ��du nosit nem�l. B� se p�evl�knout.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Se slabochy se nebav�m. To nem� ani na brn�n�?

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Rozsek�m t� na kous��ky, bandito!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Rozsek�m t� na kous��ky, pir�te!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_13_Weather"					;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Dostanu t�!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Rozsek�m t� na kousky!
	DieMonster					=	"SVM_13_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_13_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_13_SheepKiller"				;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Vrahu!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Ty chce� zdrhnout? Tak dobr�!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Cos tam pohled�val?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Zaslou�il sis to, ni�emo!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_13_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�?! Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Neubli�uj mi!
	RunAway						= 	"SVM_13_RunAway"					;//A do hajzlu!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//POPLACH!
	Guards						=	"SVM_13_Guards"					;//STR��E!
	Help						=	"SVM_13_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_13_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(k�i��) Jo! Ut�kej, jak nejrychleji m��e�!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Jo, pakuj se odsud!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Je�t� po��d nem� dost?
	StopMagic					=	"SVM_13_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Chce� napr�skat? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_13_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_13_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(dychtiv�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(zl� sm�ch) Uk�zals mu, kdo je tady p�nem!
	NotBad						= 	"SVM_13_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� krutost...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Tak ho pra��!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Dej to sem v�echno!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Uka� mu!
	Ooh01						=	"SVM_13_Ooh01"					;//Po�kej!
	Ooh02						=	"SVM_13_Ooh02"					;//D�vej pozor!
	Ooh03						=	"SVM_13_Ooh03"					;//J�! To byla trefa!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_13_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Pr� jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Pr� jsi za�el za otcem Parlanem, aby ses vyzpov�dal ze sv�ch h��ch�.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Pr� jsi za�el za Leem a dal ty v�ci do po��dku.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Takhle vra�dit na�e ovce!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Nech m� na pokoji, ty �pinav� zv��e!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Nech m� na pokoji, ty mizernej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Jsi ostudou sv�ho ��du! Po�kej, a� se o tom dozv� lord Hagen!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Jsi ostudou m�stsk�ch str��! Po�kej, a� se o tom dozv� lord Andre!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Po�kej, a� se o tom dozv� lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Po�kej, a� se o tom dozv� otec Parlan!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Po�kej, a� se to donese k Leeovi...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Po�kej, a� se o tom dozv� velitel Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Dobr�, dobr�, jsi lep�� bojovn�k ne� j�. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(arogantn�) M�m dojem, �e u� ti mus� b�t jasn�, kdo je tady ten siln�j��... Co chce�?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//M�l jsem dojem, �e ses na m� pokou�el vyt�hnout zbra�. To sis to rozmyslel? Ty sp� d�v� p�ednost ROZHOVORU, co? (sm�ch)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 zlat�ch.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...je mi to jedno...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...nikdo to nechce v�d�t...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...bylo to jeho rozhodnut�, nebo ne...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...��dn� n�vrh, �ekni...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...nem�m s t�m nic spole�n�ho...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...nem�m na takov� v�ci �as...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...nem��u se z toho jen tak vyvl�knout...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...nebude� mi ��kat...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...byl tam, ud�lal to...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...v�ci, o kter�ch ti m��u ��ct...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...na to se nem��e� spol�hat...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...j� to ��kal u� d�vno...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...a je toho v�c, v�� mi...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...n�kter� v�ci se vrac� v pln� m��e...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...�ekni, �e to nen� pravda...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...d��ve �i pozd�ji by k tomu do�lo...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...v�n� o tom m�l v�d�t v�c...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...to u� nic nezm�n�...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...nen� to ��dn� tajemstv�...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...nen� to ��dn� velk� obchod...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...myslel si, �e je to snadn� jak...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...nikdo ve skute�nosti nechce sly�et...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...a to je pravda...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...prost� poslouchej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...kdyby nebylo n�s, dopadlo by to jinak...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...prost� pot�ebuje v�c zku�enost�...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...co on v� o slu�b�...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Innos vym��� spravedliv� trest...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...cesta poctivosti je dlouh� a trnit�...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...pouze Innos rozhodne, co je spr�vn� a co ne...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_13_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_13_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_13_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_13_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_13_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Co to m� na sob�? V�bec se to k tob� nehod�. Dej mi pokoj.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Nem� na sob� zbroj � b� si ji vz�t.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//M�l bys hrd� nosit kr�lovskou zbroj a neb�hat tu v takov�ch hadrech! Odchod!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Pro� nenos� roucho na�eho ��du? B� si o tom pop�em��let!
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sob� nem� ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Ty �pinavej bandito!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Ty mizernej pir�te!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_14_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//Tak jsem t� p�ece jen dostal!
	DieEnemy					=	"SVM_14_DieEnemy"					;//S�m sis o to �ekl!
	DieMonster					=	"SVM_14_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_14_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_14_SheepKiller"					;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Tak to t� odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Tak co jsi tam teda d�lal, no!?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//Trochu velk� sousto, co, ty b��dile!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_14_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//U� nikdy t�ma sv�ma prackama nesahej na v�ci, co ti ne��kaj pane!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�? Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Prost� m� nech b�t!
	RunAway						= 	"SVM_14_RunAway"						;//Do hajzlu! Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//POPLACH!
	Guards						=	"SVM_14_Guards"						;//STR��E!
	Help						=	"SVM_14_Help"						;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(vol�) Dobr� pr�ce - o jednu �pinavou bestii m��!
	GoodKill					= 	"SVM_14_GoodKill"					;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(hlasit� k�i��) Hej, st�j, ty �pinav�e!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(probud� se) K �ertu, co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Zlato! Fajn, to si vezmu - jen tak pro za��tek.
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Ty u sebe nem� ��dn� zlato?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(varovn�) Hej! Dej si bacha!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(agresivn�) Je�t� nem� dost?
	StopMagic					=	"SVM_14_StopMagic"					;//Nep�ibli�uj se ke mn� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//P�esta� s tou magi�! M� snad n�co s u�ima!?
	WeaponDown					=	"SVM_14_WeaponDown"					;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Copak jsi nesly�el? �ekl jsem: Dej pry� tu zbra�!
	WiseMove					=	"SVM_14_WiseMove"					;//Ani to nebolelo, co?
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(pro sebe) Je�t� se uvid�.
	OhMyHead					=	"SVM_14_OhMyHead"					;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(dychtiv�) Kone�n� se n�co d�je!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(vystra�en�) Vyml�t� si navz�jem mozky z hlavy.
	GoodVictory					=	"SVM_14_GoodVictory"					;//(zl� sm�ch) Koledoval si o to!
	NotBad						= 	"SVM_14_NotBad"						;//(souhlasn�) To nebylo v�bec �patn�.
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(pro sebe) Takov� surovec...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Jo, to je ono!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Tak na co �ek�?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//V�born�!
	Ooh01						=	"SVM_14_Ooh01"						;//Jen se z toho nezvencni!
	Ooh02						=	"SVM_14_Ooh02"						;//Uka� mu, kdo je tady ��f!
	Ooh03						=	"SVM_14_Ooh03"						;//Do hajzlu!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(pro sebe, vst�v�) Co bylo zas TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Vypadni z m� postele!
	Awake						= "SVM_14_Awake"							;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Sly�el jsem, �e jsi za�el za velitelem a dal v�ci do po��dku.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//Sly�el jsem, �e jsi za�el za otcem Parlanem a vyzpov�dal ses mu ze sv�ch h��ch�.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//��k� se, �e jsi za�el za Leem a uklidnil situaci.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//To je dob�e.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Takhle vra�dit na�e ovce! Vypadni, vole!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//S mizernejma gr�zlama se nebavim!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Jdi mi z o��, ty �pinavej zlod�ji!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Jsi ostudou sv�ho ��du! Lord Hagen se bude zlobit!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Jsi ostudou m�stsk�ch str��! Lord Andre t� je�t� nau�� zp�sob�m!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre se dozv� o tom, cos provedl!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Otec Parlan o tom neusly�� r�d!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Lee ti d� co proto! Je�t� uvid�, co sis nadrobil!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Velitel Garond po tob� bude cht�t vysv�tlen�!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Tak dobr�, dobr�, vyhr�l jsi. Co chce�?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(nafoukan�) M�m ti znovu uk�zat, kdo je tady p�nem?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Zkou�� to na m� znovu, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 zlat�ch.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 zlat�ch.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 zlat�ch.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 zlat�ch.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 zlat�ch.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 zlat�ch.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 zlat�ch.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 zlat�ch.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 zlat�ch.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 zlat�ch.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 zlat�ch.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 zlat�ch.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 zlat�ch.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 zlat�ch.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 zlat�ch.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 zlat�ch.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 zlat�ch.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 zlat�ch.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 zlat�ch.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 zlat�ch.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 zlat�ch.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 zlat�ch.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 zlat�ch.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 zlat�ch.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 zlat�ch.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 zlat�ch.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 zlat�ch.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...nev���m tomu...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...nebyl bych si tak jist�...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...ale on v�, �e v�ichni...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...st�� v�m, komu v��it...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...nev�m, co ho tak rozru�ilo...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...u� tak jsem v po��dn� brynd�...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...zaslechl jsem jednu, dv� zv�sti...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...nezaj�m� m�, �e...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...nesm� v��it v�emu, co sly��...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...to nem� ode m�...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...u� jsem o tom dost p�em��lel...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...nikdo se m� neptal na n�zor...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...v�n� si nezaslou�il, aby...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...ne��kej, �es nev�d�l, �e...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...bylo to docela jasn�...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...tak kde jsi k tomu teda p�i�el...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...takhle to nemohlo j�t v��n�...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...m�m na to sv�j vlastn� n�zor...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...bylo to p�esn� tak, jak jsi ��kal...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...nev���m tomu, �e by se to mohlo zm�nit...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...to bylo poprv�, co jsem o tom sly�el...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...prost� po�k�me a uvid�me...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...v�d�l jsem, �e n�s �ekaj� probl�my...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...tak pro� m� neposlouchal...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...b�el, jako by mu byl v pat�ch samotn� Beliar...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...jasn� �e jsme nakonec dostali...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...m�l bys do toho zas�hnout a situaci vy�e�it...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...jeden nikdy nev�, jak podl� mohou b�t...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...proto�e je to v�le Innosova...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...jeho skutky byly jen...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_14_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_14_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_14_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_14_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_14_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Tyhle �aty se k tob� nehod�, ur�it� p�ede mnou n�co taj�. Nech m� b�t.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Jestli se mnou chce� mluvit, obl�kni si zbroj.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Bu� hrd� na arm�du, ke kter� pat��, a necourej se tu v takov�ch hadrech. B� se p�evl�ct!
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//N�co takov�ho by �len na�eho ��du nosit nem�l. B� se p�evl�knout.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Dyk na sob� nem� ani zbroj. Vypadni.

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Chc�pni, bandito!
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Chc�pni, pir�te!
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
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Po�kej chvilku!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nefunguje.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, je to zni�en�.
	NeedKey					= 	"SVM_15_NeedKey"					;//Na to pot�ebuju kl��...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//��dn� dal�� pakl��e...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//O p��en� z�mk� nev�m v�bec nic.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Prohled�n� v�ech pokoj� bude trvat v��nost!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm... Nem�m ani kl��, ani pakl��.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Tohle nem��u bez spr�vn�ho kl��e nikdy odemknout!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Hodilo by se p�r pakl���!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Tuhle v�c se mi nikdy nepoda�� odemknout!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Co s t�m?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hmm... Ne...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Nic, co by st�lo za to.
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nic tu nen�.
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nic, co by se dalo sebrat.
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargh
	Awake					=	"SVM_15_Awake"						;//(probud� se)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Mmh. Tak to je m�sto, kde se schov�v�. Je to zatracen� daleko. Mmh. Budu pot�ebovat lo�, abych se tam dostal.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innosi, pomoz mi a o�isti tuto svatyni.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innosi, pomoz mi a tak v�bec... Tak. To u� by m�lo b�t naposled.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ach. Kniha se otev�ela. Uvnit� je schovan� dopis a kl��.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Otev�i se!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Poj�me obchodovat.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Uka� mi sv� zbo��.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Uka� mi, co m� na sklad�.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Ch�pu.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//�, mysl�m, �e jsem n�co na�el.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Nerozum�m tomu.
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Tohle nep�e�tu!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(ka�el) No teda! Brrrr!
	HUI						=	"SVM_15_Addon_HUI"						;//Oh, oh, oh!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Co v� o tom pokusu zab�t Estebana?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//K tomu �toku na Estebana...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Pobil jsem ty zr�dce.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Hled�m ty chlapy, abych mohl vyt�hnout proti Estebanovi.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Pot�ebuj� t� v dole.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Zjev se mi, Quarhodrone, prad�vn� veliteli v�le�nick� kasty!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Hmm, tady to nefunguje.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Co bych m�l v�d�t o dolov�n� zlata?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Ah�, Francisova ��etn� kniha. Ten chlap si kouk�m z ciz�ho zlata p�kn� namastil vlastn� kapsu.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_16_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//Tak jsem t� p�ece jen dostal!
	DieEnemy					=	"SVM_16_DieEnemy"					;//S�m sis o to �ekl!
	DieMonster					=	"SVM_16_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_16_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_16_SheepKiller"					;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Tak to t� odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Tak co jsi tam teda d�lal, no?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//Trochu velk� sousto, co, ty b��dile!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_16_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//P�esta� t�ma sv�ma prackama �matat na v�ci, kter� ti nepat�ej!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�?! Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Neubli�uj mi!
	RunAway						= 	"SVM_16_RunAway"						;//Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//POPLACH!
	Guards						=	"SVM_16_Guards"					;//STR��E!
	Help						=	"SVM_16_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(vol�) Dobr� pr�ce!
	GoodKill					= 	"SVM_16_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(vol�) St�j, babo!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(vst�v�) Co se d�je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Je�t� po��d nem� dost?
	StopMagic					=	"SVM_16_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Chce� do zub�? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_16_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_16_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(nedo�kav�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(zl� sm�ch) Uk�zals mu, kdo je tady p�nem!
	NotBad						= 	"SVM_16_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� surovost...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Pra�� ho!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Dej mu co proto!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Jen mu to nandej!
	Ooh01						=	"SVM_16_Ooh01"					;//Vra� mu to!
	Ooh02						=	"SVM_16_Ooh02"					;//Tak bacha!
	Ooh03						=	"SVM_16_Ooh03"					;//Au! Takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zase TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_16_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Tak jsi za�el za velitelem a o�istil sv� jm�no.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Tak jsi za�el za otcem Parlanem a od�inil sv� h��chy.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee dal ty v�ci do po��dku.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//To je dob�e.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Nem��e� prost� takhle zab�jet na�e ovce! Padej odsud!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Jsi sprostej bandita, nechci s tebou nic m�t.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Se zlod�ji nemluv�m - a te� zmizni!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Nezachoval ses �estn�. Lordu Hagenovi se to nebude l�bit!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Tv� chov�n� je ostudou m�stsk�ch str��! Lord Andre po tob� bude cht�t vysv�tlen�!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre se dozv� o tom, cos provedl!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Zachoval ses �patn�. Jdi za otcem Parlanem a kaj se.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee se dozv� o tom, cos provedl - a trestu se nevyhne�!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Velitel Garond po tob� bude cht�t vysv�tlen�!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 zlat�ch.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...v�n�? Zaj�mav�...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...tomu nev���m...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...tak to m�j man�el nemyslel...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...jdi pry�, ne��kej mi, �e...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...p��sah�m, vid�l jsem to na vlastn� o�i...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...ne��kej...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...nikomu o tom ani muk...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...jsou to te� t�k� �asy...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...kdo ��k� n�co takov�ho?...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...kdybych to nevid�l na vlastn� o�i...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...n�kdo by m�l tu pr�ci ud�lat...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...to nen� to, co jsem sly�el...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...te� je to b�n�, nebo ne...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...s�m nedos�hne ni�eho...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...ud�lal by l�p, kdyby dr�el zob�k...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...a pracuje cel� dny, p��li�...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...nem��u se starat o v�echno...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...prost� toho moc nakec�...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...je to ve�ejn� tajemstv�...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...v�ichni to te� v�d�...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...odte� u� j� ne�eknu ani slovo...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...a bude to je�t� hor��...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...ale to je stra�n�...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...to jsem v�dycky ��kal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_16_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_16_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_16_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_16_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_16_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaaaargh!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Obl�kni si n�co slu�n�ho, takhle se na tebe nem��u koukat.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//BANDITA!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//PIR�T!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Za kr�le!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Za Innose!
	Weather						= 	"SVM_17_Weather"						;//Zatracen� slota!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//Tak jsem t� p�ece jen dostal!
	DieEnemy					=	"SVM_17_DieEnemy"					;//S�m sis o to �ekl!
	DieMonster					=	"SVM_17_DieMonster"					;//T�mhle je dal�� z t�ch ne��d�!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Mizernej zlod�ji! Jen po�kej!
	HandsOff					=	"SVM_17_HandsOff"					;//Dej ty sv� �pinav� pracky pry�!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Ten k�bl hnusu vra�d� na�e ovce!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Ta mizern� zr�da se cpe na�ima ovcema!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Vrahu!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Sem ��dn� bestie nesm�j!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Jen po�kej, ty zkurvysynu!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//�ekl sis o to!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Tak to t� odsud budu muset VYKOPAT!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Tak co jsi tam teda d�lal, no!?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Tak p�estane� s t�m u�?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Chc�pni, gr�zle!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//Trochu velk� sousto, co, ty b��dile!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//O jednu zr�du m��!
	ThiefDown					=	"SVM_17_ThiefDown"					;//U� se m� nikdy nepokou�ej okr�st!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//P�esta� t�ma sv�ma prackama �matat na v�ci, kter� ti nepat�ej!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Tohle u� nikdy ned�lej! To jsou na�e ovce!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Chc�pni, gr�zle!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//To je ale zatracen� hnusn� zr�da!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//U� na m� nikdy nevytahuj zbra�!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//M�l jsi m� poslechnout!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//A te� vypadni!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//A a� u� t� tady v�ckr�t nevid�m!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Tady ��dn� rva�ky nestrp�me, rozum�? Douf�m, �e ses z toho pou�il!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Neubli�uj mi!
	RunAway						= 	"SVM_17_RunAway"						;//Pad�m pry�!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//POPLACH!
	Guards						=	"SVM_17_Guards"					;//STR��E!
	Help						=	"SVM_17_Help"					;//Pomoc!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(vol�) Dobr� pr�ce!
	GoodKill					= 	"SVM_17_GoodKill"				;//(vol�) Jo, dej t� svini co proto!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Nech m� b�t!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(vol�) St�j, babo!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Vypadni odsud!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Co tady chce�!? Padej!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Jo, pakuj se!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hej ty! Co tady �much� kolem?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(vst�v�) Co je?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//D�ky za zlato, ty hrdino!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Ty mizernej v�iv�ku, nem� u sebe ��dn� zlato!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//M�m dojem, �e si tu tvou zbra� vezmu k sob� do �schovy.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(varovn�) D�vej si pozor! Je�t� jednou a n�jakou ti vraz�m.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Je�t� po��d nem� dost?
	StopMagic					=	"SVM_17_StopMagic"				;//P�esta� s t�m magick�m svinstvem!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Chce� do zub�? Okam�it� s t�m p�esta�!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Tak d� tu zatracenou zbra� pry�?!
	WiseMove					=	"SVM_17_WiseMove"				;//Chytrej kluk!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(pro sebe) Dobr�, p��t� se uk�e.
	OhMyHead					=	"SVM_17_OhMyHead"				;//(pro sebe) No nazdar, moje hlava...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(nedo�kav�) Aaa, boj!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(vystra�en�) Bo��nku, boj!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(zl� sm�ch) Uk�zals mu, kdo je tady p�nem!
	NotBad						= 	"SVM_17_NotBad"					;//(souhlasn�) To nebylo �patn�.
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(pro sebe) M�j bo�e! Takov� surovost...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Pra�� ho!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Dej mu co proto!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Jen mu to nandej!
	Ooh01						=	"SVM_17_Ooh01"					;//Vra� mu to!
	Ooh02						=	"SVM_17_Ooh02"					;//Tak bacha!
	Ooh03						=	"SVM_17_Ooh03"					;//Au! Takov� pecka!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(pro sebe, vst�v�) Co bylo zase TOHLE!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Vypadni z m� postele!
	Awake						= "SVM_17_Awake"					;//(z�v� od plic)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Tak jsi za�el za velitelem a o�istil sv� jm�no.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Tak jsi za�el za otcem Parlanem a od�inil sv� h��chy.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee dal ty v�ci do po��dku.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//To je dob�e.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Nem��e� prost� takhle zab�jet na�e ovce! Padej odsud!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Jsi sprostej bandita, nechci s tebou nic m�t.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Se zlod�ji nemluv�m - a te� zmizni!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Nezachoval ses �estn�. Lordu Hagenovi se to nebude l�bit!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Tv� chov�n� je ostudou m�stsk�ch str��! Lord Andre po tob� bude cht�t vysv�tlen�!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre se dozv� o tom, cos provedl!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Zachoval ses �patn�. Jdi za otcem Parlanem a kaj se.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee se dozv� o tom, cos provedl - a trestu se nevyhne�!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Velitel Garond po tob� bude cht�t vysv�tlen�!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 zlat�ch.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 zlat�ch.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 zlat�ch.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 zlat�ch.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 zlat�ch.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 zlat�ch.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 zlat�ch.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 zlat�ch.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 zlat�ch.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 zlat�ch.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 zlat�ch.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 zlat�ch.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 zlat�ch.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 zlat�ch.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 zlat�ch.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 zlat�ch.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 zlat�ch.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 zlat�ch.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 zlat�ch.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 zlat�ch.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 zlat�ch.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 zlat�ch.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 zlat�ch.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 zlat�ch.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 zlat�ch.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 zlat�ch.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 zlat�ch.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 zlat�ch.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...v�n�? Zaj�mav�...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...tomu nev���m...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...tak to m�j man�el nemyslel...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...ale jdi, ne��kej mi, �e...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...p��sah�m, vid�l jsem to na vlastn� o�i...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...ne��kej...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...nikomu o tom ani muk...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...jsou to te� t�k� �asy...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...kdo ��k� n�co takov�ho?...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...kdybych to nevid�l na vlastn� o�i...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...n�kdo by m�l tu pr�ci ud�lat...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...to nen� to, co jsem sly�el...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...te� je to b�n�, nebo ne...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...s�m nedos�hne ni�eho...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...ud�lal by l�p, kdyby dr�el zob�k...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...a pracuje cel� dny, p��li�...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...nem��u se starat o v�echno...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...prost� toho moc nakec�...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...je to ve�ejn� tajemstv�...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...v�ichni to te� v�d�...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...odte� u� j� ne�eknu ani slovo...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...a bude to je�t� hor��...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...ale to je stra�n�...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...to jsem v�dycky ��kal...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Vra� se, a� z�sk� v�c zku�enost�.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Chce� po mn� v�c, ne� t� mohu nau�it.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//U� t� nem�m co nau�it. ��k p�ekonal sv�ho u�itele.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Pod�vej, u� te� jsi lep��.
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Pr�v� se nach�z� v doln� ��sti m�sta.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Pr�v� se nach�z� v horn� ��sti m�sta.
	TEMPEL						= "SVM_17_TEMPEL"					;//Pr�v� se nach�z� na chr�mov�m n�m�st�.
	MARKT						= "SVM_17_MARKT"						;//Pr�v� jsi na tr�i�ti.
	GALGEN						= "SVM_17_GALGEN"					;//Pr�v� se nach�z� na �ibeni�n�m n�m�st�, p�ed kas�rnami.
	KASERNE						= "SVM_17_KASERNE"					;//Tohle jsou kas�rna.
	HAFEN						= "SVM_17_HAFEN"						;//Pr�v� se nach�z� v p��stavn� �tvrti.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Kam chce� j�t?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Projdi vnit�n� m�stskou branou a dostane� se do doln� ��sti m�sta.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Schodi�t� vede od ji�n� m�stsk� br�ny ke vnit�n� m�stsk� br�n�. Tam za��n� horn� ��st m�sta.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Podchodem se m��e� dostat od kov�rny na chr�mov� n�m�st�.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Pokud p�jde� po p��stavn� ulici sm�rem dol�, dostane� se do p��stavu.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//M�me tu podchod, kter� vede z chr�mov�ho n�m�st� do doln� ��sti m�sta.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//A� bude� p�ed chr�mem, pokra�uj doleva a pod�l hradeb. Tak se dostane� na tr�i�t�.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Pokud bys �el od chr�mu a pro�el kolem hospody, kterou bude� m�t po lev� ruce, vyjde� na �ibeni�n�m n�m�st�.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Pokud p�jde� od tr�i�t� pod�l vysok�ch hradeb, dostane� se ke chr�mu.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech naproti hotelu.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//A� mine� velk� kas�rna, dostane� se na �ibeni�n� n�m�st�.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Jdi uli�kou od �ibeni�n�ho n�m�st� sm�rem dol� a dostane� se na chr�mov� n�m�st�.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//A� mine� velk� kas�rna, dostane� se na tr�i�t�.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Ta obrovsk� budova jsou kas�rna. Sta�� vyj�t nahoru po schodech.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Sta�� sej�t po schodech nalevo od hlavn�ho vchodu a dostane� se na tr�i�t�.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Sta�� sej�t po schodech napravo od hlavn�ho vchodu a dostane� se na �ibeni�n� n�m�st�.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Pokud se d� p��stavn� ulic� od pob�e�n� hr�ze, dostane� se do doln� ��sti m�sta.
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(zasy��) Tady jsi!
	RunCoward    	= "SVM_19_RunCoward"    	;//(zasy��) Dostaneme t�!
	Dead      		= "SVM_19_Dead"      	;//Aaaaaargh!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




