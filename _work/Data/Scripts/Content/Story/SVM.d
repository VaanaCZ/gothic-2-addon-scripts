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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_1_Weather"						;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//Alla fine ti ho preso!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Ora sei in trappola!
	DieMonster					=	"SVM_1_DieMonster"					;//Ecco un'altra di quelle schifose bestie!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_1_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Allora dovrò CACCIARTI di qui con la forza!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//Cosa ci facevi TU lì allora, eh?
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//Ti basta, perdente?
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da ciò che non è tuo!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Vuoi lasciarmi in pace?
	RunAway						= 	"SVM_1_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALLARME!
	Guards						=	"SVM_1_Guards"						;//GUARDIE!
	Help						=	"SVM_1_Help"						;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(a gran voce) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_1_GoodKill"					;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(urlando) Fermati subito, straccione!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(svegliandosi) Dannazione, che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Oro! Bene, tanto per cominciare questo è mio...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Il bastardo non ha nemmeno dell'oro con sé.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Credo che prenderò la tua arma in custodia.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(ammonimento) Ehi! Fai attenzione!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(aggressivo) Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_1_StopMagic"					;//Tieni lontana da me la tua magia!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Ti ho detto di piantarla con la magia! Sei forse sordo?
	WeaponDown					=	"SVM_1_WeaponDown"					;//Metti giù quell'arma!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Sei sordo o cosa? Ti ho detto di mettere giù quell'arma!
	WiseMove					=	"SVM_1_WiseMove"					;//Vedi, non era così difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(fra sé e sé) Lo vedremo...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(impaziente) E adesso un po' d'azione!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(sgomento) Si stanno spaccando la testa...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(risata malefica) Se l'è meritato!
	NotBad						= 	"SVM_1_NotBad"						;//(approvando) Niente male...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(fra sé e sé) Che tizio brutale...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Sì, ottimo lavoro!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Cosa stai aspettando?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Bravo ragazzo!
	Ooh01						=	"SVM_1_Ooh01"						;//Non fare stupidaggini!
	Ooh02						=	"SVM_1_Ooh02"						;//Fagli vedere chi comanda!
	Ooh03						=	"SVM_1_Ooh03"						;//Santo cielo!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Esci dal mio letto!
	Awake						= "SVM_1_Awake"							;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Ho sentito dire che sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Ho sentito dire che sei andato da padre Parlan e ti sei pentito dei tuoi peccati.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Dicono che sei andato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Uccidere così le nostre pecore! Togliti di mezzo, sadico!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Non parlo con i luridi delinquenti!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Sparisci dalla mia vista, sporco ladro!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Sei una vergogna per il tuo ordine! Lord Hagen sarà furioso!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Sei una vergogna per la guardia cittadina! Lord Andre ti insegnerà le buone maniere!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre verrà a conoscenza di ciò che hai fatto!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Padre Parlan non sarà contento quando saprà di questo sacrilegio!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Lee ti darà quello che meriti! Vedrai cosa ti succederà per ciò che hai fatto!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Il comandante Garond vorrà una spiegazione da te!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//Va bene, va bene, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(soddisfatto) Devo farti vedere di nuovo chi è che comanda?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 monete d'oro.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 monete d'oro.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 monete d'oro.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 monete d'oro.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 monete d'oro.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 monete d'oro.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 monete d'oro.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 monete d'oro.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 monete d'oro.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 monete d'oro.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 monete d'oro.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 monete d'oro.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 monete d'oro.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 monete d'oro.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 monete d'oro.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 monete d'oro.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 monete d'oro.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 monete d'oro.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 monete d'oro.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 monete d'oro.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 monete d'oro.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 monete d'oro.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 monete d'oro.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 monete d'oro.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 monete d'oro.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 monete d'oro.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 monete d'oro.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...credi davvero che
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...tutto è possibile...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...avrebbe dovuto fare più attenzione...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...come se già non avessi abbastanza problemi...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...chi ha detto che...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...questo causerà solo ulteriori guai...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...ci sono state voci di ogni genere...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//…io non l'avrei fatto...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...sono solo voci...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...faresti meglio a stare attento a con chi parli...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//…avrei dovuto dirtelo prima...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...non me lo chiede mai nessuno...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...devi essere dispiaciuto per quel poveraccio...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...niente di nuovo...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...è assolutamente ovvio...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...non devi chiederlo a me...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...sai già come la penso...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...è esattamente ciò che ho detto...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...niente potrà mai cambiarlo...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...perché non sono stato informato prima
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...aspettiamo e vediamo che succede...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...alcuni problemi si risolvono da soli...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...non voglio più sentirne parlare...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...si stava ubriacando...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//…non mi farò trattare in quel modo...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...sono fuggiti tutti come conigli, lasciandomi completamente solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...così è scritto nei testi sacri...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...agisco sempre nel nome di Innos...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//...nessuno deve violare l'ordine divino...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo abile.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_1_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_1_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_1_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_1_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_1_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Superata la grossa caserma ti ritroverai al mercato.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaargh!
	Aargh_1						= "SVM_1_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_1_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_1_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Quelli non sono i tuoi vestiti. Con te non parlo.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Cos'hai addosso? Mettiti qualcosa di decente.
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Sei un soldato! Allora vestiti in modo adatto.
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//I tuoi vestiti non sono adatti al nostro ordine. Vai a cambiarti.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Non hai neanche un'armatura. Sparisci!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Muori, sporco brigante!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Vagabondo di un pirata!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_3_Weather"					;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Ti ho preso!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Ti farò a pezzi!
	DieMonster					=	"SVM_3_DieMonster"					;//Ecco un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_3_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Assassino!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Non vuoi andartene? Bene!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Che ci facevi lì?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Vuoi farla finita ora?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Te lo sei meritato, straccione!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//D'ora in poi, tieni la mani alla larga da ciò che non ti appartiene!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Non farmi del male!
	RunAway						= 	"SVM_3_RunAway"					;//Oh, dannazione!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALLARME!
	Guards						=	"SVM_3_Guards"					;//GUARDIE!
	Help						=	"SVM_3_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(a gran voce) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_3_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(urlando) Sì! Corri più veloce che puoi!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, cosa succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Povero idiota, non hai nemmeno monete d'oro con te!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Credo che prenderò quest'arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_3_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Vuoi una lezione? Smettila subito!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_3_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, vedremo la prossima volta...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(sgomento) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(risata malefica) Gli hai fatto vedere chi comanda!
	NotBad						= 	"SVM_3_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! Com'è brutale...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Colpisci, allora!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Metticela tutta!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Fagliela vedere!
	Ooh01						=	"SVM_3_Ooh01"					;//Tieni duro!
	Ooh02						=	"SVM_3_Ooh02"					;//Attento!
	Ooh03						=	"SVM_3_Ooh03"					;//Wow! Ci voleva proprio!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_3_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Dunque sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Dunque sei stato da padre Parlan per espiare i tuoi peccati.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Dunque sei stato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Uccidere così le nostre pecore!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Lasciami in pace, lurido bruto!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Lasciami in pace, miserabile ladruncolo!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Sei una vergogna per il tuo ordine! Aspetta che Lord Hagen lo venga a sapere!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Sei una vergogna per la guardia cittadina! Aspetta che Lord Andre lo venga a sapere!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Aspetta che Lord Andre lo venga a sapere!
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Aspetta che padre Parlan lo venga a sapere!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Aspetta che Lee lo venga a sapere!
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Aspetta che il comandante Garond lo venga a sapere!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Va bene, va bene, sei tu il guerriero migliore. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(compiaciuto) Suppongo ormai che tu sappia bene chi è il più forte fra noi... Cosa vuoi?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Credevo che stessi cercando di batterti con me. Hai cambiato idea? Preferisci PARLARE, vero? (ride)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 monete d'oro.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...credi davvero che
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...tutto è possibile...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...avrebbe dovuto fare più attenzione...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...come se già non avessi abbastanza problemi...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...chi ti ha detto che...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...questo causerà solo ulteriori guai...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...ci sono state voci di ogni genere...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//…non avrei mai pensato...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...sono solo voci...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...faresti meglio a stare attento a con chi parli...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//…avrei potuto dirtelo prima...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...non me lo chiede mai nessuno...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...devi essere dispiaciuto per quel poveraccio...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...niente di nuovo...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...è assolutamente ovvio...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...non devi chiederlo a me...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...sai già come la penso...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...è esattamente ciò che ho detto...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...niente potrà mai cambiarlo...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...perché non sono stato informato prima
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...aspettiamo e vediamo cosa succede...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...alcuni problemi si risolvono da soli...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...non voglio più sentirne parlare...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...si stava ubriacando...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//…non mi farò trattare in quel modo...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...sono fuggiti tutti come conigli, lasciandomi completamente solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...così è scritto nei testi sacri...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...agisco sempre nel nome di Innos...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...nessuno deve violare l'ordine divino...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo abile.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_3_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_3_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_3_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_3_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_3_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaargh!
	Aargh_1						= "SVM_3_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_3_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_3_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Che razza di vestiti sono quelli? Non ti vanno affatto bene. Lasciami in pace.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Se vuoi parlare, mettiti prima qualcosa di decente.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//Noi soldati indossiamo con orgoglio la nostra armatura. Vai a cambiarti.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//Nel nostro ordine siamo tutti uguali, quindi indossiamo tutti lo stesso abbigliamento. Vatti a cambiare!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Devi essere appena uscito di prigione. Prima procurati qualcosa da indossare.

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//VIENI QUI, BRIGANTE!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//VIENI QUI, PIRATA!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_4_Weather"						;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//Ancora TU?
	DieEnemy					=	"SVM_4_DieEnemy"					;//Ti farò a fettine!
	DieMonster					=	"SVM_4_DieMonster"					;//Un altro di quegli esseri!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Miserabile ladruncolo!
	HandsOff					=	"SVM_4_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Ehi! Lascia stare le nostre pecore!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Quel mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//Cosa ci fa QUELLA creatura qui?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//Sei in trappola!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//L'hai voluto tu.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Credo che con certe persone ci vogliano le maniere forti.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Cosa cercavi lì, eh?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Muori!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Che stupido bastardo...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//Va bene, ne ho abbastanza di te, sporca bestia!
	ThiefDown					=	"SVM_4_ThiefDown"					;//D'ora in poi, tieni le mani alla larga dalla mia roba, intesi?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//D'ora in poi, tieni le mani a posto!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//D'ora in poi, tieni le mani alla larga dalle mie pecore!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Non provarci di nuovo, sadico!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Che ti serva di lezione.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Alzati e vattene via!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Non voglio più vederti qui dentro. Intesi?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Sono io quello che mena da queste parti, intesi?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Lasciami in pace!
	RunAway						= 	"SVM_4_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALLARME!
	Guards						=	"SVM_4_Guards"					;//GUARDIE!
	Help						=	"SVM_4_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(a gran voce) Sì! È così che bisogna trattare quegli esseri!
	GoodKill					= 	"SVM_4_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(urla) Non finisce qui!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Fuori!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Cosa ci fai qui?
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(svegliandosi) Che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Povero idiota, non hai nemmeno monete d'oro con te!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Credo che prenderò quest'arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(aggressivo) Vuoi che ti dia un altro pugno in faccia?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Vuoi una lezione? Smettila subito!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_4_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, vedremo la prossima volta...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(sgomento) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(risata malefica) Fagli vedere chi comanda!
	NotBad						= 	"SVM_4_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! Com'è brutale...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Sì, dagli ciò che si merita!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Fagliela vedere!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Finiscilo!
	Ooh01						=	"SVM_4_Ooh01"					;//In guardia!
	Ooh02						=	"SVM_4_Ooh02"					;//Coraggio, difenditi!
	Ooh03						=	"SVM_4_Ooh03"					;//Ahia! Che male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Esci dal mio letto!
	Awake						= "SVM_4_Awake"						;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Dunque il comandante ha sistemato le cose per te.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Dunque ti sei pentito dei tuoi peccati con padre Parlan.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Ho saputo che Lee ha sistemato le cose per te.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Bene.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Uccidere così le pecore è troppo! Sparisci!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Sei un delinquente, vattene!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Maledetto ladro! Ora ne ho davvero abbastanza di te!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Mi sarei aspettato di più da un paladino! Lord Hagen non sarà contento.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Come ha fatto uno come te anche solo a entrare nella guardia cittadina? Lord Andre te la farà pagare!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre verrà informato del tuo comportamento!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Padre Parlan andrà su tutte le furie per il tuo sacrilegio!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Lee non te la farà passare liscia!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Il comandante Garond non sarà felice di sentire questo. Te la farà pagare!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Sei uno che mena forte... Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(compiaciuto) Altre domande?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//Eccoti ancora qui!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 monete d'oro.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...è la verit
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...non è ciò che ho sentito...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...non dirmi che non lo sapevi...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...di questi tempi non si sa più a chi credere...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...sono solamente tutte chiacchiere...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...io stesso non mi sento meglio...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...non c'è più niente che mi stupisca...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...non è affar mio...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...credi davvero che
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...nessuno saprà niente da me...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...quello era del tutto ovvio...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...ha dato ascolto alle persone sbagliate...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...se non se ne accorge da solo, non posso aiutarlo...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...non ti sto raccontando niente di nuovo...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...non ci avrebbe mai pensato da solo...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...la cosa è risaputa da parecchio tempo...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...è un brutto affare...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...io mi sarei comportato in maniera diversa...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...sono completamente d'accordo con te...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...cambierà mai...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...non l'ho mai saputo...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...non posso farci nulla...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...la cosa non mi stupisce...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...ma no, ha insistito dicendo che sapeva il fatto suo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...conta solo la forza, quindi non dirmi così...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...non sa nemmeno come si impugna una spada...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...sì, ha detto proprio così...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...qualcuno pagherà per questo...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos illumini tutti coloro che riconoscono la sua saggezza...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...alla fine la giustiza prevarrà...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_4_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_4_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_4_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_4_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_4_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai al mercato.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaargh!
	Aargh_1						= "SVM_4_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_4_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_4_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Prima vestiti in modo adeguato, poi parleremo ancora un po'.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Faresti meglio a indossare la tua armatura, se vuoi parlare con me.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Nessuno ti ha dato una delle nostre armature? Prima devi procurartene una.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Dov'è la tua veste? Vai a cambiarti. Poi parlerò con te.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Che razza di pezzente! Torna quando ti puoi permettere un'armatura.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Un altro brigante!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Sporco pirata!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_5_Weather"						;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//Alla fine ti ho preso!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Ora sei in trappola!
	DieMonster					=	"SVM_5_DieMonster"					;//Ecco un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_5_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Allora dovrò CACCIARTI fuori di qui!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Cosa ci facevi TU lì allora, eh?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Ti basta, perdente?
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da ciò che non è tuo!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Lasciami in pace!
	RunAway						= 	"SVM_5_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALLARME!
	Guards						=	"SVM_5_Guards"						;//GUARDIE!
	Help						=	"SVM_5_Help"						;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(a gran voce) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_5_GoodKill"					;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(urlando) Fermati subito, straccione!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(svegliandosi) Dannazione, che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Oro! Bene, tanto per cominciare questo è mio...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Il bastardo non ha nemmeno dell'oro con sé.
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Credo che prenderò la tua arma in custodia.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(ammonimento) Ehi! Fai attenzione!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(aggressivo) Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_5_StopMagic"					;//Tieni lontana da me la tua magia!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Ti ho detto di piantarla con la magia! Sei forse sordo?
	WeaponDown					=	"SVM_5_WeaponDown"					;//Metti giù quell'arma!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Sei sordo o cosa? Ti ho detto di mettere giù quell'arma!
	WiseMove					=	"SVM_5_WiseMove"					;//Vedi, non era così difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(fra sé e sé) Lo vedremo...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(impaziente) E adesso un po' d'azione!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(sgomento) Ma si stanno spaccando la testa...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(risata malefica) Se l'è meritato!
	NotBad						= 	"SVM_5_NotBad"						;//(approvando) Niente male...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(fra sé e sé) Che tizio brutale...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Sì, così si fa!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Cosa stai aspettando?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Bravo ragazzo!
	Ooh01						=	"SVM_5_Ooh01"						;//Non fare stupidaggini!
	Ooh02						=	"SVM_5_Ooh02"						;//Fagli vedere chi è che comanda!
	Ooh03						=	"SVM_5_Ooh03"						;//Santo cielo!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Esci dal mio letto!
	Awake						= "SVM_5_Awake"							;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Ho saputo che sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Ho saputo che sei andato da padre Parlan e ti sei pentito dei tuoi peccati.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//Dicono che sei andato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Uccidere così le nostre pecore! Togliti di mezzo, sadico!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Non parlo con i luridi delinquenti!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Sparisci dalla mia vista, sporco ladro!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Sei una vergogna per il tuo ordine! Lord Hagen sarà furioso!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Sei una vergogna per la guardia cittadina! Lord Andre ti insegnerà le buone maniere!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre verrà a conoscenza di ciò che hai fatto!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//padre Parlan non sarà contento di sapere di questo sacrilegio!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee ti darà quello che meriti! Vedrai cosa ti succederà per ciò che hai fatto!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Il comandante Garond vorrà una spiegazione da te!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//Va bene, va bene, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(compiaciuto) Devo farti vedere di nuovo chi è che comanda?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 monete d'oro.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 monete d'oro.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 monete d'oro.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 monete d'oro.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 monete d'oro.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 monete d'oro.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 monete d'oro.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 monete d'oro.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 monete d'oro.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 monete d'oro.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 monete d'oro.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 monete d'oro.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 monete d'oro.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 monete d'oro.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 monete d'oro.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 monete d'oro.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 monete d'oro.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 monete d'oro.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 monete d'oro.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 monete d'oro.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 monete d'oro.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 monete d'oro.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 monete d'oro.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 monete d'oro.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 monete d'oro.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 monete d'oro.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 monete d'oro.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...credi davvero che
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...tutto è possibile...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...avrebbe dovuto fare più attenzione...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...come se già non avessi abbastanza problemi...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...chi ti ha detto che...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...questo causerà solo ulteriori guai...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...ci sono state voci di ogni genere...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//…io non l'avrei fatto...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...sono solo voci...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...faresti meglio a stare attento a con chi parli...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//…avrei potuto dirtelo prima...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...non me lo chiede mai nessuno...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...devi essere dispiaciuto per quel poveraccio...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...niente di nuovo...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...è assolutamente ovvio...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...non devi chiederlo a me...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...sai già come la penso...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...è esattamente ciò che ho detto...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...niente potrà mai cambiarlo...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...perché non sono stato informato prima
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...aspettiamo e vediamo che succede...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...alcuni problemi si risolvono da soli...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...non voglio più sentirne parlare...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...si stava ubriacando...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//…non mi farò trattare in quel modo...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...sono fuggiti tutti come conigli, lasciandomi completamente solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...così è scritto nei testi sacri...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...agisco sempre nel nome di Innos...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...nessuno deve violare l'ordine divino...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_5_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_5_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_5_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_5_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_5_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaargh!
	Aargh_1						= "SVM_5_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_5_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_5_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Prima mettiti qualcosa di adatto.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//Cos'hai addosso? Non sei più uno di noi? Allora non voglio avere niente a che fare con te.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//Noi soldati ci battiamo per il Re, quindi faresti meglio a indossare la sua armatura.
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Perché l'ordine ti dà degli abiti se poi non li indossi? Pensaci.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Che razza di pezzente! Non hai neanche un'armatura. Vattene.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Ah, un brigante.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Ti farò a pezzettini, pirata!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_6_Weather"					;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Ti prenderò!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Non saresti dovuto venire qui!
	DieMonster					=	"SVM_6_DieMonster"					;//Vieni qui, brutta bestia!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_6_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Ehi! Lascia stare le nostre pecore!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Stai alla larga dalle nostre pecore, bestia!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Assassino!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Te ne pentirai!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//E non dire che non ti avevo avvertito.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Ehi! ESCI FUORI!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Ehi! Cosa cerchi lì?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Smettila! Immediatamente!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Mi eserciterò con te, bastardo!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Hai avuto ciò che meritavi...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Ehi, non ho perso ancora la mano!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Ti avverto! Non provarci di nuovo, sporco ladro!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da ciò che non è tuo!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//E stai alla larga dalle nostre pecore!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Non osare mai più attaccarmi!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//E non dire che non ti avevo avvertito.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//E ora vattene!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Non voglio mai più rivederti qui dentro, intesi?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Niente combattimenti qui. Che ti serva di lezione.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Non fare stupidaggini!
	RunAway						= 	"SVM_6_RunAway"						;//Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALLARME!
	Guards						=	"SVM_6_Guards"					;//GUARDIE!
	Help						=	"SVM_6_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(rivolto a qualcuno) Manda quelle bestie all'altro mondo!
	GoodKill					= 	"SVM_6_GoodKill"				;//(urla) Sì, dai a quel bastardo ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(grida) Ti prenderò!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Non hai motivo per restare qui!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, cosa vuoi?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Beh, almeno hai qualche moneta d'oro con te.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Non hai nemmeno una moneta d'oro, che disdetta.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Credo che prenderò la tua arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(avvertimento) Ragazzo! Non farlo mai più!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(combattivo) Vuoi un'altra ripassata?
	StopMagic					=	"SVM_6_StopMagic"				;//Smettila subito con quella magia!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Ultimo avvertimento! Metti via la magia!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Abbassa quell'arma o sarà peggio per te!
	WiseMove					=	"SVM_6_WiseMove"				;//Ehi, non sei così stupido come sembri!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(fra sé e sé) Non farlo mai più...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(fra sé e sé) Oh! La mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(impaziente) E ora viene il bello...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(sgomento) Oh mio dio!
	GoodVictory					=	"SVM_6_GoodVictory"			;//(risata malefica) Che gli serva di lezione...
	NotBad						= 	"SVM_6_NotBad"					;//(approva) Ci voleva proprio!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(fra sé e sé) Che sporco bruto!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Stendilo!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Non fermarti ora!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Finiscilo!
	Ooh01						=	"SVM_6_Ooh01"					;//Attento!
	Ooh02						=	"SVM_6_Ooh02"					;//Para, allora!
	Ooh03						=	"SVM_6_Ooh03"					;//Dannazione! Fa male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_6_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Dunque il comandante ha sistemato le cose per te.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Padre Parlan ti ha assolto dal tuo peccato.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Dunque sei andato da Lee e hai sistemato quella faccenda.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Bene.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Stai attaccando le pecore? Suppongo tu non sia riuscito a trovare un avversario più indifeso, non è così?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Non voglio avere niente a che fare con i delinquenti come te!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Non ho niente da dire ai ladri come te!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//E tu vorresti diventare un paladino? Aspetta di sentire cosa ne pensa Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Fai davvero parte della guardia cittadina? Lord Andre non potrà tollerare ciò che hai fatto!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Vai da Lord Andre finché sei in tempo.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Vai da padre Parlan. Ti aiuterà a espiare i tuoi peccati!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee verrà informato di questo e non la passerai liscia.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Il comandante Garond non sarà felice di sentire questo. Avresti fatto meglio a parlargli prima che le cose peggiorassero!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//D'accordo, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(soddisfatto) Credo che ora tu sappia con chi hai a che fare. Cosa vuoi?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Ancora tu? Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 monete d'oro.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...non posso crederci...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...non ne sarei così sicuro...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...ma lui era a conoscenza di ogni cosa...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...non so più in cosa credere...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...non capisco come mai se la prenda così tanto...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//…ho già abbastanza guai...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...ho saputo un paio di cose...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...non voglio toccarlo...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...non devi credere a tutto ciò che senti...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...non l'ha saputo da me...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//…l'avevo pensato anch'io...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...nessuno chiede mai la mia opinione...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...non se lo meritava proprio...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...non dirmi che non lo sapevi...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...era abbastanza ovvio...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...dove l'hai trovato allora...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...mi sono fatto una mia opinione in proposito...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...era proprio come avevi detto tu...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...non credo che la situazione cambierà...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...è la prima volta che ne sento parlare...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...possiamo solo aspettare e vedere che succede...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...sapevo che sarebbe stato un problema...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...perché allora non vogliono ascoltarmi
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...è scappato come se avesse Beliar in persona alle calcagna...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//…ovviamente alla fine l'abbiamo preso...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...devi intervenire e risolvere la faccenda...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...qualcuno non sa ancora nemmeno quanto sono malvagi...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...perché quella è la volontà di Innos...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...le sue azioni erano giuste...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_6_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_6_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_6_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_6_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_6_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaargh!
	Aargh_1						= "SVM_6_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_6_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_6_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//Così combinato sei davvero ridicolo. Mettiti qualcosa di decente.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Non pensare che non ti riconosca. Fila a cambiarti.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Soldato. Che razza di vestiti sono quelli? Vai a cambiarti, immediatamente!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Un servitore di Innos non si cela dietro un travestimento. Vai a prendere la tua veste.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Cosa ci fai conciato come uno scavatore? Mettiti qualcosa addosso.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Te la stai prendendo con la persona sbagliata, BRIGANTE!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Tornatene in mare, PIRATA!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_7_Weather"						;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Ancora TU?
	DieEnemy					=	"SVM_7_DieEnemy"					;//Ti farò a fettine!
	DieMonster					=	"SVM_7_DieMonster"					;//Un altro di quegli esseri!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Miserabile ladruncolo!
	HandsOff					=	"SVM_7_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Ehi! Lascia stare le nostre pecore!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Quel mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//Cosa ci fa QUELLA creatura qui?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Sei in trappola!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//L'hai voluto tu.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Credo che con certe persone ci vogliano le maniere forti.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Cosa cercavi lì, eh?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Muori!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Che stupido bastardo...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Va bene, ne ho abbastanza di te, sporca bestia!
	ThiefDown					=	"SVM_7_ThiefDown"					;//D'ora in poi, tieni le mani alla larga dalla mia roba, intesi?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//D'ora in poi, tieni le mani a posto!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//D'ora in poi, tieni le mani alla larga dalle mie pecore!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Non provarci di nuovo, assassino!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Che ti serva di lezione.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Alzati e vattene via!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Non voglio più vederti qui dentro. Intesi?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//Sono io quello che mena da queste parti, intesi?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Lasciami in pace!
	RunAway						= 	"SVM_7_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALLARME!
	Guards						=	"SVM_7_Guards"					;//GUARDIE!
	Help						=	"SVM_7_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(a gran voce) Sì! È così che bisogna trattare quegli esseri!
	GoodKill					= 	"SVM_7_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(urla) Non finisce qui!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Fuori!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Cosa ci fai qui?
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(svegliandosi) Che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Povero idiota, non hai nemmeno monete d'oro con te!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Credo che prenderò quest'arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(aggressivo) Vuoi che ti dia un altro pugno in faccia?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Vuoi una lezione? Smettila subito!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_7_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, vedremo la prossima volta...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(sgomento) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(risata malefica) Gli hai fatto vedere chi comanda!
	NotBad						= 	"SVM_7_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! Com'è brutale...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Sì, dagli ciò che si merita!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Fagliela vedere!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Dagli ciò che si merita!
	Ooh01						=	"SVM_7_Ooh01"					;//In guardia!
	Ooh02						=	"SVM_7_Ooh02"					;//Coraggio, difenditi!
	Ooh03						=	"SVM_7_Ooh03"					;//Ahia! Che male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Esci dal mio letto!
	Awake						= "SVM_7_Awake"						;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Dunque il comandante ha sistemato le cose per te.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Dunque ti sei pentito dei tuoi peccati con padre Parlan.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Ho saputo che Lee ha sistemato le cose per te.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Bene.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Uccidere così le pecore è troppo! Sparisci!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Sei un delinquente, vattene!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Maledetto ladro! Ora ne ho davvero abbastanza di te!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Mi sarei aspettato di più da un paladino! Lord Hagen non sarà contento.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Come ha fatto uno come te anche solo a entrare nella guardia cittadina? Lord Andre te la farà pagare!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre verrà informato del tuo comportamento!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Padre Parlan andrà su tutte le furie per il tuo sacrilegio!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee non te la farà passare liscia!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Il comandante Garond non sarà felice di sentire questo. Te la farà pagare!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Sei uno che mena forte... Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(compiaciuto) Altre domande?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//Eccoti ancora qui!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 monete d'oro.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...è la verit
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...non è ciò che ho sentito...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...non dirmi che non lo sapevi...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...di questi tempi non si sa più a chi credere...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...sono solamente tutte chiacchiere...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...io stesso non mi sento meglio...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...non c'è più niente che mi stupisca...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...non è affar mio...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...credi davvero che...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...nessuno saprà niente da me...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...quello era del tutto ovvio...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...ha dato ascolto alle persone sbagliate...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...se non se ne accorge da solo, non posso aiutarlo...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...non ti sto raccontando niente di nuovo...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...non ci avrebbe mai pensato da solo...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...la cosa è risaputa da parecchio tempo...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...è un brutto affare...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...io mi sarei comportato in maniera diversa...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...sono completamente d'accordo con te...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...cambierà mai...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...non l'ho mai saputo...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...non puoi farci nulla...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...la cosa non mi stupisce...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...ma no, ha insistito dicendo che sapeva il fatto suo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...conta solo la forza, quindi non dirmi così...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...non sa nemmeno come si impugna una spada...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...sì, ha detto proprio così...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...qualcuno pagherà per questo...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos illumini tutti coloro che riconoscono la sua saggezza...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...alla fine la giustiza prevarrà...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_7_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_7_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_7_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_7_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_7_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaargh!
	Aargh_1						= "SVM_7_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_7_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_7_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Perché quel travestimento? Non ci parlo con te, così combinato.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//Cos'hai addosso? Mettiti la nostra armatura, avanti!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//Questa è una violazione dei canoni di abbigliamento dell'esercito. Vai a cambiarti immediatamente.
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Farai meglio a indossare la tua veste. Fino ad allora, non dirò nulla e pregherò per te.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Cosa vuoi? Non sei uno di noi. Non porti nemmeno la nostra armatura.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Muori, miserabile brigante!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Muori, miserabile pirata!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_8_Weather"					;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Ti ho preso!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Ti farò a fettine!
	DieMonster					=	"SVM_8_DieMonster"					;//Un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_8_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Assassino!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Non vuoi andartene? Bene!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Cosa ci facevi allora lì, eh?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Te lo sei meritato, straccione!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//D'ora in poi, tieni la mani alla larga da ciò che non ti appartiene!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//E ora fuori dai piedi!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Non farmi del male!
	RunAway						= 	"SVM_8_RunAway"					;//Oh, dannazione!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALLARME!
	Guards						=	"SVM_8_Guards"					;//GUARDIE!
	Help						=	"SVM_8_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(a gran voce) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_8_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(urlando) Sì! Corri più veloce che puoi!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, cosa succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Povero idiota, non hai nemmeno monete d'oro con te!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Credo che prenderò quest'arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_8_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Vuoi una lezione? Smettila subito!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_8_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, vedremo la prossima volta...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(sgomento) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(risata malefica) Se l'è meritato!
	NotBad						= 	"SVM_8_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! Com'è brutale...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Colpisci, allora!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Metticela tutta!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Fagliela vedere!
	Ooh01						=	"SVM_8_Ooh01"					;//Tieni duro!
	Ooh02						=	"SVM_8_Ooh02"					;//Attento!
	Ooh03						=	"SVM_8_Ooh03"					;//Wow! Ci voleva proprio!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_8_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Dunque sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Dunque sei stato da padre Parlan per espiare i tuoi peccati.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Dunque sei stato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Uccidere così le nostre pecore!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Lasciami in pace, lurida bestia!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Lasciami in pace, miserabile ladruncolo!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Sei una vergogna per il tuo ordine! Aspetta che Lord Hagen sappia cos'hai fatto!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Sei una vergogna per la guardia cittadina! Aspetta che Lord Andre sappia cos'hai fatto!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Aspetta che Lord Andre sappia cos'hai fatto.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Aspetta che padre Parlan sappia cos'hai fatto.
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Aspetta che Lee sappia cos'hai fatto...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Aspetta che il comandante Garond sappia cos'hai fatto!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Va bene, va bene, sei tu il guerriero migliore. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(compiaciuto) Suppongo ormai che tu sappia bene chi è il più forte fra noi... Cosa vuoi?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Credevo che stessi cercando di batterti con me. Hai cambiato idea? Preferisci PARLARE, vero? (ride)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 monete d'oro.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...è la verit
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...non è ciò che ho sentito...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...non dirmi che non lo sapevi...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...di questi tempi non si sa più a chi credere...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...sono solamente tutte chiacchiere...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...io stesso non mi sento meglio...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...non c'è più niente che mi stupisca...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...non è affar mio...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...credi davvero che...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...nessuno saprà niente da me...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...quello era del tutto ovvio...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...ha dato ascolto alle persone sbagliate...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...se non se ne accorge da solo, non posso aiutarlo...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...non ti sto raccontando niente di nuovo...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...non ci avrebbe mai pensato da solo...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...la cosa è risaputa da parecchio tempo...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...è un brutto affare...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...io mi sarei comportato in maniera diversa...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...sono completamente d'accordo con te...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...cambierà mai...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...non l'ho mai saputo...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...non puoi farci nulla...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...la cosa non mi stupisce...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...ma no, ha insistito dicendo che sapeva il fatto suo...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...conta solo la forza, quindi non dirmi così...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...non sa nemmeno come si impugna una spada...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...sì, ha detto proprio così...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...qualcuno pagherà per questo...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos illumini tutti coloro che riconoscono la sua saggezza...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...alla fine la giustiza prevarrà...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_8_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_8_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_8_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_8_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_8_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaargh!
	Aargh_1						= "SVM_8_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_8_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_8_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Non mi fido di te. C'è qualcosa che non va in te o nel modo in cui sei vestito.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Da come ti vesti mi sa che presti servizio da qualche altra parte. Non ho niente da dire a uno come te!
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Dobbiamo fare la nostra figura. Quindi vai a prendere la tua armatura.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos vuole che indossiamo con orgoglio la sua veste. Vai a cambiarti.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Non parlo con gli scavatori! Non hai neanche un'armatura.

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Sporco brigante!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//I PIRATI!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_9_Weather"						;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Ti ho preso!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Non saresti mai dovuto venire qui!
	DieMonster					=	"SVM_9_DieMonster"					;//Vieni qui, brutta bestia!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Un'altra di quelle bestie!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Ecco un'altra di quelle schifose bestie!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Sporco ladro! Aspetta!
	HandsOff					=	"SVM_9_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Ehi! Lascia stare le nostre pecore!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Stai alla larga dalle nostre pecore, bestia!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Assassino!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Te ne ferò pentire!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Ti avevo avvertito!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Ho detto FUORI!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Ehi! Cosa stavi facendo lì?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Smettila! Immediatamente!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Mi eserciterò con te, bastardo!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//Ne ho abbastanza di te...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Basta così, lurida bestia!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//UN mostro di meno nei paraggi!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Ti avverto! Non provarci di nuovo, sporco ladro!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da ciò che non è tuo!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//E stai alla larga dalle nostre pecore!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Non osare mai più attaccarmi!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Ti avevo avvertito.
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//E ora vattene!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Non voglio mai più rivederti qui dentro, intesi?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Non ci saranno combattimenti qui e non dimenticartelo.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Non fare stupidaggini!
	RunAway						= 	"SVM_9_RunAway"						;//Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALLARME!
	Guards						=	"SVM_9_Guards"					;//GUARDIE!
	Help						=	"SVM_9_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(rivolto a qualcuno) Manda quelle bestie all'altro mondo!
	GoodKill					= 	"SVM_9_GoodKill"				;//(urla) Sì, dai a quel bastardo ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(grida) Ti prenderò!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Non hai motivo per restare qui!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, cosa vuoi?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Beh, almeno hai qualche moneta d'oro con te.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Non hai nemmeno una moneta d'oro, che disdetta.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Credo che prenderò la tua arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(avvertimento) Ragazzo! Non farlo mai più!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(aggressivo) Vuoi un'altra ripassata?
	StopMagic					=	"SVM_9_StopMagic"				;//Smettila subito con quella magia!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Ultimo avvertimento! Metti via la magia!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Abbassa quell'arma o sarà peggio per te!
	WiseMove					=	"SVM_9_WiseMove"				;//Ehi, non sei così stupido come sembri!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(fra sé e sé) Non farlo mai più...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(fra sé e sé) Oh! La mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(impaziente) E ora viene il bello...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(sgomento) Oh mio dio!
	GoodVictory					=	"SVM_9_GoodVictory"			;//(risata malefica) Che gli serva di lezione...
	NotBad						= 	"SVM_9_NotBad"					;//(approva) Ci voleva proprio!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(fra sé e sé) Che sporco bruto!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Stendilo!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Non fermarti ora!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Finiscilo!
	Ooh01						=	"SVM_9_Ooh01"					;//Attento!
	Ooh02						=	"SVM_9_Ooh02"					;//Para, allora!
	Ooh03						=	"SVM_9_Ooh03"					;//Dannazione! Fa male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_9_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Dunque il comandante ha sistemato le cose per te.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Padre Parlan ti ha assolto dal tuo peccato.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Dunque sei andato da Lee e hai sistemato quella faccenda.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Bene.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Stai attaccando le pecore? Suppongo tu non sia riuscito a trovare un avversario più indifeso, non è così?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Non voglio avere niente a che fare con i delinquenti come te!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Non ho niente da dire ai ladri come te!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//E tu vorresti diventare un paladino? Aspetta di sentire cosa ne pensa Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Fai davvero parte della guardia cittadina? Lord Andre non potrà tollerare ciò che hai fatto!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Vai da Lord Andre finché sei in tempo.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Vai da padre Parlan. Ti aiuterà a espiare i tuoi peccati!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee verrà informato di questo e non la passerai liscia.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Il comandante Garond non sarà felice di sentire questo. Avresti fatto meglio a parlargli prima che le cose peggiorassero!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//D'accordo, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(soddisfatto) Credo che ora tu sappia con chi hai a che fare. Cosa vuoi?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//Ancora tu? Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 monete d'oro.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...non posso crederci...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...non ne sarei così sicuro...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...ma lui era a conoscenza di ogni cosa...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...non so più in cosa credere...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...non capisco come mai se la prenda così tanto...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//…ho già abbastanza guai...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...ho saputo un paio di cose...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...non voglio toccarlo...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...non devi credere a tutto ciò che senti...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...non l'ha saputo da me...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//…l'avevo pensato anch'io...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...nessuno chiede mai la mia opinione...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...non se lo meritava proprio...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...non dirmi che non lo sapevi...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...era ovvio...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...dove l'hai trovato allora...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//…ho una mia opinione in proposito...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...era proprio come avevi detto tu...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...non credo che la situazione cambierà...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...è la prima volta che ne sento parlare...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...possiamo solo aspettare e vedere cosa succede...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...sapevo che sarebbe stato un problema...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...perché allora non vogliono ascoltarmi
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...è scappato come se avesse Beliar in persona alle calcagna...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//…ovviamente alla fine l'abbiamo preso...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...devi intervenire e risolvere la faccenda...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...qualcuno non sa ancora nemmeno quanto sono malvagi...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...perché quella è la volontà di Innos...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...le sue azioni erano giuste...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo abile.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_9_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_9_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_9_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_9_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_9_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaargh!
	Aargh_1						= "SVM_9_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_9_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_9_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//E la tenuta? Mettiti qualcosa di adatto.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//Cos'hai addosso? Mettiti la tua armatura, avanti!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Tu lavori per il Re, quindi faresti meglio a indossare la sua armatura. Vai a cambiarti.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//I tuoi vestiti non sono adatti al nostro ordine. Vai a cambiarti.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Non hai neanche un'armatura. Sparisci!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//E ora è il tuo turno, brigante!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Non avresti dovuto farti vedere qui, pirata.
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_10_Weather"						;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//Ancora TU?
	DieEnemy					=	"SVM_10_DieEnemy"					;//Ti farò a fettine!
	DieMonster					=	"SVM_10_DieMonster"					;//Un altro di quegli esseri!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Miserabile ladruncolo!
	HandsOff					=	"SVM_10_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Ehi! Lascia stare le nostre pecore!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Quel mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//Cosa ci fa QUELLA creatura qui?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//Sei in trappola!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//L'hai voluto tu.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Credo che con certe persone ci vogliano le maniere forti.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Cosa cercavi lì, eh?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Muori!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Che stupido bastardo...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//Va bene, ne ho abbastanza di te, sporca bestia!
	ThiefDown					=	"SVM_10_ThiefDown"					;//D'ora in poi, tieni giù le mani dalla mia roba, intesi?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//D'ora in poi, tieni le mani a posto!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//D'ora in poi, tieni le mani alla larga dalle mie pecore!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Non provarci di nuovo, sadico!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Che ti serva di lezione.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Alzati e vattene via!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Non voglio più vederti qui dentro. Intesi?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Sono io quello che mena da queste parti, intesi?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Lasciami in pace!
	RunAway						= 	"SVM_10_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALLARME!
	Guards						=	"SVM_10_Guards"					;//GUARDIE!
	Help						=	"SVM_10_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(a gran voce) Sì! È così che bisogna trattare quegli esseri!
	GoodKill					= 	"SVM_10_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(urla) Non finisce qui!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Fuori!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Cosa ci fai qui?
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(svegliandosi) Che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Povero idiota, non hai nemmeno monete d'oro con te!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Credo che prenderò quest'arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(avvertimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(aggressivo) Vuoi che ti dia un altro pugno in faccia?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Vuoi una lezione? Smettila subito!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_10_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, vedremo la prossima volta...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(sgomento) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(risata malefica) Sicuramente ha imparato la lezione!
	NotBad						= 	"SVM_10_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! Com'è brutale...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Sì, dagli ciò che si merita!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Fagliela vedere!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Finiscilo!
	Ooh01						=	"SVM_10_Ooh01"					;//In guardia!
	Ooh02						=	"SVM_10_Ooh02"					;//Coraggio, colpiscilo!
	Ooh03						=	"SVM_10_Ooh03"					;//Ahia! Che male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Esci dal mio letto!
	Awake						= "SVM_10_Awake"						;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Dunque il comandante ha sistemato le cose per te.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Dunque ti sei pentito dei tuoi peccati con padre Parlan.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Ho saputo che Lee ha sistemato le cose per te.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Uccidere così le pecore è troppo! Sparisci!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Sei un delinquente, vattene!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Maledetto ladro! Ora ne ho davvero abbastanza di te!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Mi sarei aspettato di più da un paladino! Lord Hagen non sarà contento.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Come ha fatto uno come te anche solo a entrare nella guardia cittadina? Lord Andre te la farà pagare!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre verrà informato del tuo comportamento!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Padre Parlan andrà su tutte le furie per il tuo sacrilegio!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Lee non te la farà passare liscia!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Il comandante Garond non sarà felice di sentire questo. Te la farà pagare!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Sei uno che mena forte... Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(soddisfatto) Altre domande?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//Eccoti ancora qui!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 monete d'oro.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//…non me ne importa niente...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...nessuno vuole saperlo...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...è stata una sua decisione, non è cos
	Smalltalk04					= "SVM_10_Smalltalk04"				;//…non ne ho idea, dimmelo tu...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//…voglio restarne fuori...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//…non ho tempo per queste cose...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//…non riuscirei a farla franca...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...non c'è bisogno che tu me lo dica...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...sono stato lì, tutto sistemato...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...le cose che potrei dirti...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...non puoi fare affidamento su questo...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//…lo dicevo anch'io una volta...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...e credimi, c'è dell'altro...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...è sempre la stessa storia...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...dimmi che non è vero...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...sarebbe dovuto accadere prima o poi...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...avrebbe dovuto fare più attenzione...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...non cambierà mai...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...non è un segreto...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...non era granché...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...crede che sia così semplice...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...nessuno vuole sentirne parlare veramente...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...e questa è la verità...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...ascolta ciò che ha da dirti...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...le cose sarebbero andate in maniera diversa se non fosse stato per noi...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...ha solo bisogno di allenarsi di più...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...che ne sa lui del dovere
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Innos infligge una giusta punizione...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...il cammino della virtù è lungo e difficile
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...solo Innos può decidere ciò che è giusto e ciò che è sbagliato...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_10_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_10_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_10_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_10_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_10_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaargh!
	Aargh_1						= "SVM_10_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_10_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_10_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Che razza di vestiti sono quelli? Non ti stanno affatto bene. Lasciami in pace.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Se sei uno di noi, dovresti vestirti come noi. Prima vai a cambiarti.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Se ti danno l'armatura del Re, faresti meglio a indossarla.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Se rinneghi la tua veste, rinneghi Innos. Vai e rifletti su questo.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Se non ti puoi neanche permettere un'armatura, perché dovrei parlare con te?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Sporco brigante!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Sporco pirata!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(esclama) Aspetta!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_11_Weather"						;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Alla fine ti ho preso!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Ora sei in trappola!
	DieMonster					=	"SVM_11_DieMonster"					;//Un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_11_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_11_SheepKiller"					;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Allora dovrò CACCIARTI fuori di qui!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Cosa ci facevi TU lì allora, eh?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Ti basta, perdente?
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da quello che non ti riguarda!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Lasciami in pace!
	RunAway						= 	"SVM_11_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALLARME!
	Guards						=	"SVM_11_Guards"						;//GUARDIE!
	Help						=	"SVM_11_Help"						;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(urla) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_11_GoodKill"					;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(urlando) Fermati subito, straccione!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Sì, vai via di qui!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(svegliandosi) Dannazione, che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Oro! Bene, tanto per cominciare questo è mio...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Il bastardo non ha nemmeno dell'oro con sé.
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Credo che prenderò la tua arma in custodia.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(ammonimento) Ehi! Fai attenzione!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(aggressivo) Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_11_StopMagic"					;//Tieni lontana da me la tua magia!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Ti ho detto di piantarla con la magia! Sei forse sordo?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Metti giù quell'arma!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Sei sordo o cosa? Ti ho detto di mettere giù quell'arma!
	WiseMove					=	"SVM_11_WiseMove"					;//Vedi, non era così difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(fra sé e sé) Lo vedremo...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(impaziente) E adesso un po' d'azione!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(sgomento) Si stanno spaccando la testa...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(risata malefica) Se l'è meritato!
	NotBad						= 	"SVM_11_NotBad"						;//(approvando) Niente male...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(fra sé e sé) Che tizio brutale...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Sì, così si fa!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Che stai aspettando?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//Bravo ragazzo!
	Ooh01						=	"SVM_11_Ooh01"						;//Non fare stupidaggini!
	Ooh02						=	"SVM_11_Ooh02"						;//Fagli vedere chi è che comanda!
	Ooh03						=	"SVM_11_Ooh03"						;//Santo cielo!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Esci dal mio letto!
	Awake						= "SVM_11_Awake"							;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Ho saputo che sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Ho saputo che sei andato da padre Parlan e ti sei pentito dei tuoi peccati.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Dicono che sei andato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Uccidere così le nostre pecore! Togliti di mezzo, sadico!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Non parlo con i luridi delinquenti!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Sparisci dalla mia vista, sporco ladro!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Sei una vergogna per il tuo ordine! Lord Hagen sarà furioso!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Sei una vergogna per la guardia cittadina! Lord Andre ti insegnerà le buone maniere!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre verrà a conoscenza di ciò che hai fatto!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Padre Parlan non sarà contento di sapere di questo sacrilegio!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee ti darà quello che meriti! Vedrai cosa ti succederà per ciò che hai fatto!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Il comandante Garond vorrà una spiegazione da te!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Va bene, va bene, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(compiaciuto) Devo farti vedere di nuovo chi è che comanda?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 monete d'oro.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 monete d'oro.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 monete d'oro.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 monete d'oro.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 monete d'oro.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 monete d'oro.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 monete d'oro.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 monete d'oro.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 monete d'oro.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 monete d'oro.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 monete d'oro.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 monete d'oro.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 monete d'oro.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 monete d'oro.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 monete d'oro.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 monete d'oro.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 monete d'oro.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 monete d'oro.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 monete d'oro.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 monete d'oro.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 monete d'oro.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 monete d'oro.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 monete d'oro.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 monete d'oro.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 monete d'oro.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 monete d'oro.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 monete d'oro.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//...credi davvero che
	Smalltalk02					= "SVM_11_Smalltalk02"					;//...tutto è possibile...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//...avrebbe dovuto fare più attenzione...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//...come se già non avessi abbastanza problemi...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//...chi ti ha detto che...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//...questo causerà solo ulteriori guai...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//...ci sono state voci di ogni genere...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//…io non l'avrei fatto...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//...quelle sono solo voci...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//...faresti meglio a stare attento a con chi parli...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//…avrei potuto dirtelo prima...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//...non me lo chiede mai nessuno...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//...devi essere dispiaciuto per quel poveraccio...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//...niente di nuovo...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//...è assolutamente ovvio...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//...non devi chiederlo a me...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//...sai già come la penso...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//...è esattamente ciò che ho detto...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//...niente potrà mai cambiarlo...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//...perché non sono stato informato prima
	Smalltalk22					= "SVM_11_Smalltalk22"					;//...aspettiamo e vediamo che succede...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//...alcuni problemi si risolvono da soli...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//...non voglio più sentirne parlare...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//...si stava ubriacando...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//…non mi farò trattare in quel modo...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//...sono fuggiti tutti come conigli, lasciandomi completamente solo...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//...così è scritto nei testi sacri...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//...agisco sempre nel nome di Innos...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//...nessuno deve violare l'ordine divino...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_11_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_11_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_11_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_11_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_11_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaargh!
	Aargh_1						= "SVM_11_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_11_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_11_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Che razza di vestiti sono quelli? Non ti stanno affatto bene. Lasciami in pace.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Gentilmente, porta la nostra armatura quando parlo con te. Su, sbrigati.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Dovresti indossare l'armatura del Re. Ora vai.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//I tuoi vestiti non sono adatti al nostro ordine. Vai a cambiarti.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Non hai neanche un'armatura. Sparisci!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Un altro brigante.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//I PIRATI!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_12_Weather"					;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Ti ho preso!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Non saresti mai dovuto venire qui!
	DieMonster					=	"SVM_12_DieMonster"					;//Vieni qui, brutta bestia!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Sporco ladro! Aspetta!
	HandsOff					=	"SVM_12_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Ehi! Lascia stare le nostre pecore!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Stai alla larga dalle nostre pecore, bestia!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Assassino!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Te ne ferò pentire!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Ti avevo avvertito!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Ho detto FUORI!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Ehi! Cosa stavi facendo lì?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Smettila! Immediatamente!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Mi eserciterò con te, bastardo!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Questo è per te...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//Adoro tutto questo!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//UN mostro di meno nei paraggi!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Ti avverto! Non provarci di nuovo, sporco ladro!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da ciò che non è tuo!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//E stai alla larga dalle nostre pecore!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Non osare mai più attaccarmi!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Ti avevo avvertito.
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//E ora vattene!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Non voglio mai più rivederti qui dentro, intesi?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Non ci saranno combattimenti qui e non dimenticartelo.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Non fare stupidaggini!
	RunAway						= 	"SVM_12_RunAway"						;//Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALLARME!
	Guards						=	"SVM_12_Guards"					;//GUARDIE!
	Help						=	"SVM_12_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(rivolto verso qualcuno) Manda quelle bestie all'altro mondo!
	GoodKill					= 	"SVM_12_GoodKill"				;//(urla) Sì, dai a quel bastardo ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(grida) Ti prenderò!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Non hai motivo per restare qui!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, cosa vuoi?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Beh, almeno hai qualche moneta d'oro con te.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Non hai nemmeno una moneta d'oro, che disdetta.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Credo che prenderò la tua arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(avvertimento) Ragazzo! Non farlo mai più!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(aggressivo) Vuoi un'altra ripassata?
	StopMagic					=	"SVM_12_StopMagic"				;//Smettila subito con quella magia!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Ultimo avvertimento! Metti via la magia!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Abbassa quell'arma o sarà peggio per te!
	WiseMove					=	"SVM_12_WiseMove"				;//Ehi, non sei così stupido come sembri!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(fra sé e sé) Non farlo mai più...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(fra sé e sé) Oh! La mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(impaziente) E ora viene il bello...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(sgomento) Oh mio dio...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(risata malefica) Che gli serva di lezione...
	NotBad						= 	"SVM_12_NotBad"					;//(approva) Ci voleva proprio!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(fra sé e sé) Che sporco bruto!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Stendilo!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Non fermarti ora!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Finiscilo!
	Ooh01						=	"SVM_12_Ooh01"					;//Attento!
	Ooh02						=	"SVM_12_Ooh02"					;//Para, allora!
	Ooh03						=	"SVM_12_Ooh03"					;//Dannazione! Fa male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_12_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Dunque il comandante ha sistemato le cose per te.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Padre Parlan ti ha assolto dal tuo peccato.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Dunque sei andato da Lee e hai sistemato quella faccenda.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Bene.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Stai attaccando le pecore? Suppongo tu non sia riuscito a trovare un avversario più indifeso, non è così?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Non voglio avere niente a che fare con i delinquenti come te!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Non ho niente da dire ai ladri come te!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//E tu vorresti diventare un paladino? Aspetta di sentire cosa ne pensa Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Fai davvero parte della guardia cittadina? Lord Andre non potrà tollerare ciò che hai fatto!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Vai da Lord Andre finché sei in tempo.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Vai da padre Parlan. Ti aiuterà a espiare i tuoi peccati!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee verrà informato di questo e non la passerai liscia.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Il comandante Garond non sarà felice di sentire questo. Avresti fatto meglio a parlargli prima che le cose peggiorassero!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//D'accordo, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(soddisfatto) Credo che ora tu sappia con chi hai a che fare. Cosa vuoi?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//Ancora tu? Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 monete d'oro.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//…non me ne importa niente...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//...nessuno vuole saperlo...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//...è stata una sua decisione, non è cos
	Smalltalk04					= "SVM_12_Smalltalk04"				;//…non ne ho idea, dimmelo tu...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//…voglio restarne fuori...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//…non ho tempo per queste cose...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//…non riuscirei a farla franca...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//...non c'è bisogno che tu me lo dica...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//...sono stato lì, tutto sistemato...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//...le cose che potrei dirti...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//...non puoi fare affidamento su questo...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//…lo dicevo anch'io una volta...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//...e credimi, c'è dell'altro...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//...è sempre la stessa storia...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//...dimmi che non è vero...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//...sarebbe dovuto accadere prima o poi...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//...avrebbe dovuto fare più attenzione...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//...non cambierà mai...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//...non è un segreto...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//...non era granché...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//...crede che sia così semplice...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//...nessuno vuole sentirne parlare veramente...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//...e questa è la verità...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...ascolta ciò che ha da dirti...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//...le cose sarebbero andate in maniera diversa se non fosse stato per noi...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//...ha solo bisogno di allenarsi di più...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//...che ne sa lui del dovere
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//...Innos infligge una giusta punizione...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//...il cammino della virtù è lungo e difficile
	Smalltalk30					= "SVM_12_Smalltalk30"				;//...solo Innos può decidere ciò che è giusto e ciò che è sbagliato...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_12_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_12_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_12_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_12_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_12_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaargh!
	Aargh_1						= "SVM_12_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_12_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_12_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//I tuoi abiti non ti si addicono. Prima vai a cambiarti.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Indossa la tua armatura, se vuoi parlare con me.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Un soldato indossa l'armatura del Re. NON qualcosa d'altro! Quindi vai a cambiarti.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//I tuoi vestiti non sono adatti al nostro ordine. Vai a cambiarti.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Non ti puoi neanche permettere un'armatura. Non parlo con i poveracci!

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Ti farò a pezzettini, brigante!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Ti farò a pezzettini, pirata!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_13_Weather"					;//Tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Ti prenderò!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Ti farò a fettine!
	DieMonster					=	"SVM_13_DieMonster"					;//Un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_13_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_13_SheepKiller"				;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Assassino!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Non vuoi andartene? Bene!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Che ci facevi lì?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Vuoi farla finita ora?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Te lo sei meritato, straccione!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da ciò che non è tuo!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Non farmi del male!
	RunAway						= 	"SVM_13_RunAway"					;//Oh, dannazione!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALLARME!
	Guards						=	"SVM_13_Guards"					;//GUARDIE!
	Help						=	"SVM_13_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(a gran voce) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_13_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(urlando) Sì! Corri più veloce che puoi!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Sì, vattene via!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, cosa succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Povero idiota, non hai nemmeno monete d'oro con te!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Credo che prenderò quest'arma.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_13_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Vuoi una lezione? Smettila subito!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_13_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, vedremo la prossima volta...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(sgomento) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(risata malefica) Gli hai fatto vedere chi comanda!
	NotBad						= 	"SVM_13_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! Com'è brutale...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Colpisci, allora!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Metticela tutta!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Fagliela vedere!
	Ooh01						=	"SVM_13_Ooh01"					;//Tieni duro!
	Ooh02						=	"SVM_13_Ooh02"					;//Attento!
	Ooh03						=	"SVM_13_Ooh03"					;//Wow! Ci voleva proprio!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_13_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Dunque sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Dunque sei stato da padre Parlan per espiare i tuoi peccati.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Dunque sei stato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Uccidere così le nostre pecore!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Lasciami in pace, lurida bestia!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Lasciami in pace, miserabile ladruncolo!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Sei una vergogna per il tuo ordine! Aspetta che Lord Hagen sappia cos'hai fatto!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Sei una vergogna per la guardia cittadina! Aspetta che Lord Andre sappia cos'hai fatto!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Aspetta che Lord Andre sappia cos'hai fatto.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Aspetta che padre Parlan sappia cos'hai fatto.
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Aspetta che Lee sappia cos'hai fatto...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Aspetta che il comandante Garond sappia cos'hai fatto!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Va bene, va bene, sei tu il guerriero migliore. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(compiaciuto) Suppongo ormai che tu sappia bene chi è il più forte fra noi... Cosa vuoi?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Credevo che stessi cercando di batterti con me. Hai cambiato idea? Preferisci PARLARE, vero? (ride)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 monete d'oro.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//…non me ne importa niente...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...nessuno vuole saperlo...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...è stata una sua decisione, non è cos
	Smalltalk04					= "SVM_13_Smalltalk04"				;//…non ne ho idea, dimmelo tu...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//…voglio restarne fuori...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//…non ho tempo per queste cose...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//…non riuscirei a farla franca...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...non c'è bisogno che tu me lo dica...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...sono stato lì, tutto sistemato...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...le cose che potrei dirti...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...non puoi fare affidamento su questo...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//…lo dicevo anch'io una volta...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...e credimi, c'è dell'altro...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...è sempre la stessa storia...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...dimmi che non è vero...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...sarebbe dovuto accadere prima o poi...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...avrebbe dovuto fare più attenzione...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...non cambierà mai...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...non è un segreto...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...non era granché...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...crede che sia così semplice...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...nessuno vuole sentirne parlare veramente...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...e questa è la verità...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...ascolta ciò che ha da dirti...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...le cose sarebbero andate in maniera diversa se non fosse stato per noi...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...ha solo bisogno di allenarsi di più...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...che ne sa lui del dovere
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Innos infligge una giusta punizione...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...il cammino della virtù è lungo e difficile
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...solo Innos può decidere ciò che è giusto e ciò che è sbagliato...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_13_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_13_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_13_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_13_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_13_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaargh!
	Aargh_1						= "SVM_13_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_13_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_13_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Che razza di vestiti sono quelli? Non ti stanno affatto bene. Lasciami in pace.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Non indossi la tua armatura. Vai a prenderla.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Dovresti essere orgoglioso di indossare l'armatura del Re, invece di andare in giro con quegli stracci. Ora vai!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Perché non indossi gli abiti del nostro ordine? Vai e rifletti su questo.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Non hai neanche un'armatura. Sparisci!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Sporco brigante!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Miserabile pirata!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_14_Weather"						;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//Alla fine ti ho preso!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Ora sei in trappola!
	DieMonster					=	"SVM_14_DieMonster"					;//Un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_14_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_14_SheepKiller"					;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Allora dovrò CACCIARTI fuori di qui!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Cosa ci facevi TU lì allora, eh?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//Ti basta, perdente?
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da quello che non ti riguarda!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Lasciami in pace!
	RunAway						= 	"SVM_14_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALLARME!
	Guards						=	"SVM_14_Guards"						;//GUARDIE!
	Help						=	"SVM_14_Help"						;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(a gran voce) Ben fatto, una sporca bestia di meno!
	GoodKill					= 	"SVM_14_GoodKill"					;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(urlando) Fermati subito, straccione!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Sì, vai via di qui!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(svegliandosi) Dannazione, che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Oro! Bene, tanto per cominciare questo è mio...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Il bastardo non ha nemmeno dell'oro con sé.
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Credo che prenderò la tua arma in custodia.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(ammonimento) Ehi! Fai attenzione!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(aggressivo) Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_14_StopMagic"					;//Tieni lontana da me la tua magia!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Ti ho detto di piantarla con la magia! Sei forse sordo?
	WeaponDown					=	"SVM_14_WeaponDown"					;//Metti giù quell'arma!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Sei sordo o cosa? Ti ho detto di mettere giù quell'arma!
	WiseMove					=	"SVM_14_WiseMove"					;//Vedi, non era così difficile.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(fra sé e sé) Lo vedremo...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(impaziente) E adesso un po' d'azione!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(sgomento) Si stanno spaccando la testa...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(risata malefica) Se l'è meritato!
	NotBad						= 	"SVM_14_NotBad"						;//(approvando) Niente male...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(fra sé e sé) Che tizio brutale...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Sì, così si fa!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Che stai aspettando?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Bravo ragazzo!
	Ooh01						=	"SVM_14_Ooh01"						;//Non fare stupidaggini!
	Ooh02						=	"SVM_14_Ooh02"						;//Fagli vedere chi è che comanda!
	Ooh03						=	"SVM_14_Ooh03"						;//Santo cielo!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Esci dal mio letto!
	Awake						= "SVM_14_Awake"							;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Ho saputo che sei andato dal comandante e hai sistemato le cose.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//Ho saputo che sei andato da padre Parlan e ti sei pentito dei tuoi peccati.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Dicono che sei andato da Lee e hai sistemato la faccenda.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Mi fa piacere.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Uccidere così le nostre pecore! Togliti di mezzo, sadico!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Non parlo con i luridi delinquenti!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Sparisci dalla mia vista, sporco ladro!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Sei una vergogna per il tuo ordine! Lord Hagen sarà furioso!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Sei una vergogna per la guardia cittadina! Lord Andre ti insegnerà le buone maniere!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre verrà a conoscenza di ciò che hai fatto!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Padre Parlan non sarà contento di sapere di questo sacrilegio!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Lee ti darà quello che meriti! Vedrai cosa ti succederà per ciò che hai fatto!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Il comandante Garond vorrà una spiegazione da te!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Va bene, va bene, hai vinto. Cosa vuoi?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(soddisfatto) Devo farti vedere di nuovo chi è che comanda?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Stai cercando di batterti nuovamente con me, vero?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 monete d'oro.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 monete d'oro.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 monete d'oro.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 monete d'oro.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 monete d'oro.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 monete d'oro.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 monete d'oro.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 monete d'oro.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 monete d'oro.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 monete d'oro.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 monete d'oro.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 monete d'oro.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 monete d'oro.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 monete d'oro.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 monete d'oro.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 monete d'oro.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 monete d'oro.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 monete d'oro.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 monete d'oro.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 monete d'oro.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 monete d'oro.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 monete d'oro.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 monete d'oro.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 monete d'oro.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 monete d'oro.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 monete d'oro.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 monete d'oro.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...non posso crederci...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...non ne sarei così sicuro...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...ma lui era a conoscenza di ogni cosa...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...non so più in cosa credere...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...non capisco come mai se la prenda così tanto...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//…ho già abbastanza guai...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...ho saputo un paio di cose...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...non voglio toccarlo...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...non devi credere a tutto ciò che senti...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...non l'ha saputo da me...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//…l'avevo pensato anch'io...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...nessuno chiede mai la mia opinione...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...non se lo meritava proprio...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...non dirmi che non lo sapevi...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...era abbastanza ovvio...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...dove l'hai trovato allora...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...non può andare avanti così per sempre...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...mi sono fatto una mia opinione in proposito...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...era proprio come avevi detto tu...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...non credo che la situazione cambierà...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...questa è la prima volta che ne sento parlare...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...possiamo solo aspettare e vedere che succede...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...sapevo che sarebbe stato un problema...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...perché allora non vogliono ascoltarmi
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...è scappato come se avesse Beliar in persona alle calcagna...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//…ovviamente alla fine l'abbiamo preso...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...devi intevernire e risolvere la faccenda...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...qualcuno non sa ancora nemmeno quanto sono malvagi...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...perché quella è la volontà di Innos...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...le sue azioni erano giuste...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_14_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_14_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_14_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_14_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_14_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaargh!
	Aargh_1						= "SVM_14_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_14_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_14_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//I tuoi abiti non ti si addicono. Devi avere qualcosa da nascondere. Lasciami in pace.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Se vuoi parlarmi, devi indossare la nostra armatura.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Sii orgoglioso dell'esercito e non andare in giro con quegli stracci. Prima vai a cambiarti.
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//I tuoi vestiti non sono adatti al nostro ordine. Vai a cambiarti.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Non hai neanche un'armatura. Sparisci!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Muori, brigante.
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Muori, pirata.
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Ehi, tu!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//Ehi, tu!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//Ehi!
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//Ehi!
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Aspetta un attimo!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Non funziona.
	PickBroke				= 	"SVM_15_PickBroke"					;//Mmmh, è rotto.
	NeedKey					= 	"SVM_15_NeedKey"					;//Mi serve una chiave...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Ho finito i grimaldelli...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Non so niente su come scassinare le serrature.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Per spazzare tutte le stanze mi ci vorrà un'eternità!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Mmmh... Non ho un grimaldello né una chiave.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Non riuscirò mai ad aprirla senza la chiave giusta!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Un paio di grimaldelli potrebbero tornarmi utili!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Non riuscirò mai ad aprire questa cosa!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Con cosa?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Mmmh... No...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Non c'è niente da prendere...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Non c'è niente...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Non c'è niente da saccheggiare...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Argh!
	Aargh_2					=	"SVM_15_Aargh_2"					;//Argh!
	Aargh_3					=	"SVM_15_Aargh_3"					;//Argh!
	Dead					=	"SVM_15_Dead"						;//Aaargh!
	Awake					=	"SVM_15_Awake"						;//(si sveglia)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Mmmh. Ecco dove ti nascondi. È troppo lontano. Mi servirà una nave.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innos, concedimi il tuo aiuto e purifica questo santuario.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innos, concedimi il tuo aiuto eccetera... Ecco, questo dovrebbe essere l'ultimo.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ah, il libro si è aperto. C'è una lettera e una chiave all'interno.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Apriti!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Facciamo uno scambio.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Mostrami la mercanzia.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Mostrami quello che hai.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Capisco.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ah. Penso di aver trovato qualcosa.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Non capisco...
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Non riesco a leggerlo!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(tossisce) Santo cielo. Brrr!!
	HUI						=	"SVM_15_Addon_HUI"						;//Oh oh oh!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Che cosa sai dell'attentato alla vita di Esteban?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//A proposito dell'aggressione ad Esteban
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Ucciderò quei traditori.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Sto cercando quei tizi per poter attaccare Esteban.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//C'è bisogno di te nella miniera.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Presentati a me, Quarhodron, antico capo della casta dei guerrieri!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Mmmh. Qui non funziona.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Cosa devo sapere sulla miniera d'oro?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Aha. Il libro paga di Francis. A quanto pare quell'uomo si è intascato un bel po' d'oro.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_16_Weather"						;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//Alla fine ti ho preso!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Ora sei in trappola!
	DieMonster					=	"SVM_16_DieMonster"					;//Un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_16_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_16_SheepKiller"					;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Allora dovrò CACCIARTI fuori di qui!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Cosa ci facevi TU lì allora, eh?
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//Ti basta, perdente?
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da quello che non ti riguarda!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Non farmi del male!
	RunAway						= 	"SVM_16_RunAway"						;//Dannazione! Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALLARME!
	Guards						=	"SVM_16_Guards"					;//GUARDIE!
	Help						=	"SVM_16_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(urla) Bel lavoro!
	GoodKill					= 	"SVM_16_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(urlando) Fermati immediatamente, codardo!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Sì, vai via di qui!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(svegliandosi) Dannazione, che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Il bastardo non ha nemmeno dell'oro con sé.
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Credo che prenderò la tua arma in custodia.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_16_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Vuoi una lezione? Falla finita immediatamente!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_16_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, lo vedremo la prossima volta...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(sgomenta) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(risata malefica) Gli hai fatto vedere chi comanda!
	NotBad						= 	"SVM_16_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! È terribile...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Colpiscilo!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Dagli quello che si merita!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Dagli ciò che si merita!
	Ooh01						=	"SVM_16_Ooh01"					;//Difenditi!
	Ooh02						=	"SVM_16_Ooh02"					;//Fai attenzione, allora!
	Ooh03						=	"SVM_16_Ooh03"					;//Oh! Che male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_16_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Dunque sei andato dal comandante e ti sei discolpato.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Dunque sei andando da padre Parlan e hai espiato i tuoi peccati.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee ha sistemato la faccenda per te.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Mi fa piacere.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Non puoi uccidere le nostre pecore in questo modo! Vattene!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Non voglio avere niente a che fare con i delinquenti come te!
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Non ho niente da dire ai ladri come te! E ora sparisci!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Il tuo comportamento non ti fa onore. Lord Hagen non ne sarà contento!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Il tuo comportamento è una vergogna per la guardia cittadina! Lord Andre vorrà una spiegazione!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre saprà ciò che hai fatto!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Hai tenuto un comportamento sbagliato. Vai da padre Parlan e pentiti.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee scoprirà cos'hai fatto e ti punirà!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Il comandante Garond vorrà una spiegazione da te!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 monete d'oro.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...sul serio? Molto interessante...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//…non ci credo...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//…non è ciò che pensa mio marito...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...sparisci, non voglio saperlo...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//…sul serio, l'ho visto con i miei occhi...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//…non dirai
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...non dirlo a nessuno...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...questi sono tempi duri...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...chi è che mette in giro queste voci?
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...se non l'avessi visto con i miei stessi occhi...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...qualcuno deve farlo...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...non è ciò che ho sentito...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...è normale, non è vero
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...non può tenersi tutto quanto per sé...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//…avrebbe fatto meglio a tenere la bocca chiusa...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...e lavora anche tutto il giorno...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//…non posso occuparmi di tutto per tutti quanti...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//…parla semplicemente troppo...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...è un segreto ormai noto..
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...lo sanno tutti ormai...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...d'ora in poi non le dirò più niente...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...e peggiorerà ancora...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...ma è terribile...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...è ciò che ho sempre sostenuto...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_16_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_16_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_16_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_16_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_16_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaargh!
	Aargh_1						= "SVM_16_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_16_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_16_Aargh_3"					;//Argh!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Mettiti qualcosa di decente. Non voglio vederti così combinato.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//UN BRIGANTE!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//UN PIRATA!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Per il Re!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Per Innos!
	Weather						= 	"SVM_17_Weather"						;//Che tempo schifoso!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//Alla fine ti ho preso!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Ora sei in trappola!
	DieMonster					=	"SVM_17_DieMonster"					;//Un'altra di quelle bestie schifose!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Sporco ladro! Aspetta e vedrai!
	HandsOff					=	"SVM_17_HandsOff"					;//Giù le mani da lì!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Quel bastardo sta uccidendo le nostre pecore!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Quel dannato mostro sta mangiando le nostre pecore!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Assassino!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Non sono ammesse bestie qui!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Aspetta e vedrai, figlio di buona donna!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//L'hai voluto tu!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Allora dovrò CACCIARTI fuori di qui!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Cosa ci facevi TU lì allora, eh?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Smettila subito!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Muori, bastardo!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//Ti basta, perdente?
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Un mostro di meno nei paraggi!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Non provare mai più a derubarmi!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//D'ora in poi, tieni le mani alla larga da quello che non ti riguarda!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Non provarci di nuovo! Quelle sono le nostre pecore!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Muori, assassino!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//Che stupida bestia sanguinaria!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Non sfidarmi mai più!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Avresti dovuto darmi retta!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//E ora sparisci!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//E non farti più ribeccare lì dentro!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Niente combattimenti qui, intesi? Che ti serva di lezione!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Non farmi del male!
	RunAway						= 	"SVM_17_RunAway"						;//Me ne vado!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALLARME!
	Guards						=	"SVM_17_Guards"					;//GUARDIE!
	Help						=	"SVM_17_Help"					;//Aiuto!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(urla) Bel lavoro!
	GoodKill					= 	"SVM_17_GoodKill"				;//(a gran voce) Sì, dai a quel maiale ciò che si merita!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Lasciami in pace!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(urlando) Fermati immediatamente, codardo!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Fuori da qui!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Che cosa vuoi? Vattene!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Sì, vai via di qui!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Ehi tu! Cosa stai cercando?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(svegliandosi) Che succede?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Grazie per l'oro, mio eroe!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Il bastardo non ha nemmeno dell'oro con sé.
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Credo che prenderò la tua arma in custodia.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(ammonimento) Stai attento! Provaci un'altra volta e ti farò a pezzi.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Non ne hai ancora avuto abbastanza?
	StopMagic					=	"SVM_17_StopMagic"				;//Smettila con questa dannata magia!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Vuoi una lezione? Falla finita immediatamente!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Metti via quell'arma!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Vuoi mettere via quella dannata arma?
	WiseMove					=	"SVM_17_WiseMove"				;//Bravo ragazzo!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(fra sé e sé) Beh, lo vedremo la prossima volta...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(fra sé e sé) Santo cielo, la mia testa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(impaziente) Ah, un combattimento!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(sgomenta) Oh mio dio, un combattimento!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(risata malefica) Gli hai fatto vedere chi comanda!
	NotBad						= 	"SVM_17_NotBad"					;//(approvando) Non male...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(fra sé e sé) Mio dio! È terribile...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Colpiscilo!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Dagli quello che si merita!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Dagli ciò che si merita!
	Ooh01						=	"SVM_17_Ooh01"					;//Difenditi!
	Ooh02						=	"SVM_17_Ooh02"					;//Fai attenzione, allora!
	Ooh03						=	"SVM_17_Ooh03"					;//Oh! Che male!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(fra sé e sé, svegliandosi) Cos'è stato QUELLO?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Esci dal mio letto!
	Awake						= "SVM_17_Awake"					;//(grosso sbadiglio)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Dunque sei andato dal comandante e ti sei discolpato.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Dunque sei andando da padre Parlan e hai espiato i tuoi peccati.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee ha sistemato la faccenda per te.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Mi fa piacere.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Non puoi uccidere le nostre pecore in questo modo! Vattene!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Non voglio avere niente a che fare con i delinquenti come te!
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Non ho niente da dire ai ladri come te - e ora sparisci!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Il tuo comportamento non ti fa onore. Lord Hagen non ne sarà contento!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Il tuo comportamento è una vergogna per la guardia cittadina! Lord Andre vorrà una spiegazione!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre saprà ciò che hai fatto!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Hai tenuto un comportamento sbagliato. Vai da padre Parlan e pentiti.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee scoprirà cos'hai fatto e ti punirà!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Il comandante Garond vorrà una spiegazione da te!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 monete d'oro.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 monete d'oro.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 monete d'oro.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 monete d'oro.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 monete d'oro.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 monete d'oro.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 monete d'oro.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 monete d'oro.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 monete d'oro.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 monete d'oro.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 monete d'oro.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 monete d'oro.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 monete d'oro.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 monete d'oro.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 monete d'oro.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 monete d'oro.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 monete d'oro.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 monete d'oro.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 monete d'oro.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 monete d'oro.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 monete d'oro.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 monete d'oro.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 monete d'oro.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 monete d'oro.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 monete d'oro.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 monete d'oro.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 monete d'oro.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 monete d'oro.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...sul serio? Molto interessante...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//…non ci credo...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//…non è ciò che pensa mio marito...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...sparisci, non voglio saperlo...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//…sul serio, l'ho visto con i miei occhi...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//…non dirai
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...non dirlo a nessuno...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...questi sono tempi duri...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...chi è che mette in giro queste voci?
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...se non l'avessi visto con i miei stessi occhi...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...qualcuno deve farlo...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...non è ciò che ho sentito...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...è normale, non è vero
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...non può tenersi tutto quanto per sé...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//…avrebbe fatto meglio a tenere la bocca chiusa...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...e lavora anche tutto il giorno...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//…non posso occuparmi di tutto per tutti quanti...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//…parla semplicemente troppo...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...si tratta di un segreto che sanno tutti...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...lo sanno tutti ormai...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...d'ora in poi non le dirò più niente...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...e peggiorerà ancora...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...ma è terribile...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...è ciò che ho sempre sostenuto...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Torna quando avrai più esperienza.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Mi stai chiedendo più di quanto io possa insegnarti.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Non c'è altro che io possa insegnarti. Sei diventato troppo bravo.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Vedi? Sei già migliorato...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Ti trovi nella parte bassa della città.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Ti trovi nella parte alta della città.
	TEMPEL						= "SVM_17_TEMPEL"					;//Ti trovi nel tempio.
	MARKT						= "SVM_17_MARKT"						;//Ti trovi al mercato.
	GALGEN						= "SVM_17_GALGEN"					;//Ti trovi nella piazza del patibolo di fronte alla caserma.
	KASERNE						= "SVM_17_KASERNE"					;//Questa è la caserma.
	HAFEN						= "SVM_17_HAFEN"						;//Ti trovi nel distretto del porto.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Dove vorresti andare?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Passa per il cancello interno e raggiungerai la parte bassa della città.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//C'è una rampa di scale che conduce dal cancello a sud a quello interno. È lì che comincia la parte alta della città.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Attraversando il sottopassaggio dalla bottega del fabbro raggiungerai la piazza del tempio.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Percorrendo la strada del porto dalla bottega del fabbro arriverai alle banchine.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Il sottopassaggio nella piazza del tempio conduce alla parte bassa della città.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Quando ti trovi di fronte al tempio, procedi in alto a sinistra e costeggia le mura cittadine per raggiungere il mercato.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Arrivando dal tempio, superata la taverna sulla sinistra giungerai nella piazza del patibolo.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Costeggiando le alte mura cittadine dal mercato, giungerai al tempio.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale di fronte alla locanda.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Superata la grossa caserma ti ritroverai nella piazza del patibolo.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Percorri il viale dalla piazza del patibolo e raggiungerai la piazza del tempio.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Superata la caserma ti ritroverai nel mercato.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//L'imponente edificio è la caserma. Basta salire le scale.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Scendi le scale sulla sinistra dell'ingresso principale e raggiungerai il mercato.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Scendi le scale sulla destra dell'ingresso principale e raggiungerai la piazza del patibolo.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Seguendo la strada del porto dal muraglione del molo raggiungerai la parte bassa della città.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//Aaargh!
	Aargh_1						= "SVM_17_Aargh_1"					;//Argh!
	Aargh_2						= "SVM_17_Aargh_2"					;//Argh!
	Aargh_3						= "SVM_17_Aargh_3"					;//Argh!
	
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(fischia) È qui!
	RunCoward    	= "SVM_19_RunCoward"    	;//(fischia) Ti prenderemo!
	Dead      		= "SVM_19_Dead"      	;//Aaargh!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Argh!
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Argh!
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Argh!
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




