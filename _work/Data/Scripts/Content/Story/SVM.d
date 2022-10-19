// *********************
// Standard	Voice Module
// *********************

CLASS C_SVM
{
	// ------ B_Say_GuildGreetings ------
	var string MILGreetings;				//Miliz grьЯt Miliz oer Paladin
	var string PALGreetings;				//Paladin grьЯt Paladin oder Magier
	var string Weather;						//So ein Mistwetter!
	
	// ------ B_Say_AttackReason ------
	var string IGetYouStill;				//Upset-NSC sieht Spieler wдhrned seiner Angry-Time wieder. Greift mit altem AttackReason an.
	var string DieEnemy;					//Feind wird angegriffen
	var string DieMonster;					//gefдhrliches Monster wird angegriffen
	var string Addon_DieMonster;
	var string Addon_DieMonster2;
	var string DirtyThief;					//Dieb wird angegriffen
	var string HandsOff;					//SC fummelt an Objekt rum
	var string SheepKiller;					//Mensch greift Schaf an
	var string SheepKillerMonster;			//Monster greift Schaf an
	var string YouMurderer;					//Mensch hat Menschen umgebracht (kein Feind)
	var string DieStupidBeast;				//Torwachen schlagen ungefдhliches Monster tot, das versucht durchs Tor zu gehen	
	var string YouDareHitMe;				//SC hat NSC geschlagen
	var	string YouAskedForIt;				//SC hat trotz Aufforderung seine Waffe NICHT weggesteckt
	var string ThenIBeatYouOutOfHere;		//SC hat trotz Aufforderung Raum NICHT verlassen 
	var string WhatDidYouDoInThere;			//Wache sieht SC aus einem verbotenen Raum rauskommen und greift an
	var string WillYouStopFighting;			//Wache beendet Kampf, greift Tдter an
	
	// ------ B_Say_AttackEND ------
	var string KillEnemy;					//Finishing-Move
	var string EnemyKilled;					//NSC hat Feind getцtet
	var string MonsterKilled;				//NSC hat gefдhrliches Monster getцtet
	var string Addon_MonsterKilled;			
	var string Addon_MonsterKilled2;	
	var string ThiefDown;					//NSC hat Item-Dieb niedergeschlagen
	var string RumfummlerDown;				//NSC hat verbotenes-MOBSI-Benutzer niedergeschlagen
	var string SheepAttackerDown;			//NSC hat human SheepAttacker oder SheepKiller umgehauen
	var string KillMurderer;				//Mцrder finishen
	var string StupidBeastKilled;			//GateGuards tцten neutrales Monster, das vorbeikam
	var string NeverHitMeAgain;				//NSC hat jemand niedergeschlagen, der ihn angegriffen hat
	var string YouBetterShouldHaveListened;	//NSC hat jemed niedergeschlagen, der die Waffe nicht weggesteckt hat
	var string GetUpAndBeGone;				//NSC hat einen Eindringling im Portalraum niedergeschlagen
	var string NeverEnterRoomAgain;			//NSC hat Spieler, der aus verbotenem Portalraum kam niedergeschlagen
	var string ThereIsNoFightingHere;		//Wache hat Tдter einer Schlдgerei (derjenige, der angefangen hat) niedergeschlagen

	// ------ C_WantToFlee ------ 
	var string SpareMe;						//Tu mir nichts!
	var string RunAway;						//ScheiЯe! Nichts wie weg!		

	// ------ C_WantToCallGuardsForFight ------
	var	string Alarm;						//Wache ruft Wache
	var string Guards;						//Harter Bursche ruft Wache
	var string Help;						//Bьrger ruft Hilfe
		
	// ------ B_AssessMurder ------
	var string GoodMonsterKill;				//Monster getцtet - NSC findet das toll
	var string GoodKill;					//Mensch getцtet - NSC findet das toll (war sein Feind)
	
	// ------ B_AssessTalk ------
	var string NOTNOW;						//wenn RefuseTalk Counter aktiv
	
	// ------ ZS_Attack ------
	var string RunCoward;					//Gegner flieht
	
	// ------ ZS_ClearRoom ------
	var string GetOutOfHere;				//Spieler in verbotenem Raum. Harter Bursche: Raus hier!
	var string WhyAreYouInHere;				//Spieler in verbotenem Raum. Weicher Bursche: Was willst du hier?
	var string YesGoOutOfHere;				//Spieler verlдЯt verboten Raum artig wieder

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
	var string OhMyGodItsAFight;			//NSC entdeckt einen Kampf, und findet das bestьtzend (Bьrger)
	var string GoodVictory;					//Dem Sieger zujubeln
	var string NotBad;						//'Nicht schlecht...' - Kampfende - Freund wurde von Nicht-Freund besiegt
	var string OhMyGodHesDown;				//Bestьrzung ьber brutales Niederschlagen
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
	var string GOLD_1000;					//1000 Goldstьcke.
	var string GOLD_950;					//950 Goldstьcke.
	var string GOLD_900;					//900 Goldstьcke.
	var string GOLD_850;					//850 Goldstьcke.
	var string GOLD_800;					//800 Goldstьcke.
	var string GOLD_750;					//750 Goldstьcke.
	var string GOLD_700;					//700 Goldstьcke.
	var string GOLD_650;					//650 Goldstьcke.
	var string GOLD_600;					//600 GOldstьcke.
	var string GOLD_550;					//550 Goldstьcke.
	var string GOLD_500;					//500 Goldstьcke.
	var string GOLD_450;					//450 Goldstьcke.
	var string GOLD_400;					//400 Goldstьcke.
	var string GOLD_350;					//350 Goldstьcke.
	var string GOLD_300;					//300 Goldstьcke.
	var string GOLD_250;					//250 Goldstьcke.
	var string GOLD_200;					//200 Goldstьcke.
	var string GOLD_150;					//150 Goldstьcke.
	var string GOLD_100;					//100 Goldstьcke.
	var string GOLD_90;						//90 Goldstьcke.
	var string GOLD_80;						//80 Goldstьcke.
	var string GOLD_70;						//70 Goldstьcke.
	var string GOLD_60;						//60 Goldstьcke.
	var string GOLD_50;						//50 Goldstьcke.
	var string GOLD_40;						//40 Goldstьcke.
	var string GOLD_30;						//30 Goldstьcke.
	var string GOLD_20;						//20 Goldstьcke.
	var string GOLD_10;						//10 Goldstьcke.
	
	// ------ B_Say_Smalltalk (TA_Smalltalk) ------
	VAR	string Smalltalk01;				// ...wenn Du meinst...
	VAR	string Smalltalk02;				// ...kann schon sein...
	VAR	string Smalltalk03;				// ...war nicht besonders schlau....
	VAR	string Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	string Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	string Smalltalk06;				// ...war doch klar, daЯ das Дrger gibt...
	VAR	string Smalltalk07;				// ...aber behalt's fьr Dich, muЯ nicht gleich jeder wissen...
	VAR	string Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	string Smalltalk09;				// ...an der Gechichte muЯ wohl doch was dran sein...
	VAR	string Smalltalk10;				// ...man muЯ eben aufpassen was man rumerzдhlt...
	VAR	string Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	string Smalltalk12;				// ...man darf auch nicht alles glauben, was man hцrt...
	VAR	string Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	string Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	string Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	string Smalltalk16;				// ...frьher wдre das ganz anders gelaufen...
	VAR	string Smalltalk17;				// ...gequatscht wird viel...
	VAR	string Smalltalk18;				// ...ich hцr nicht mehr auf das Gefasel...
	VAR	string Smalltalk19;				// ...verlaЯ Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	string Smalltalk20;				// ...ich glaube kaum, daЯ sich daran was дndern wird...
	VAR	string Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	string Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiЯ gegessen, wie es gekocht wird...
	VAR	string Smalltalk23;				// ...ich dachte, das wдre schon lange geklдrt, aber das ist wohl nicht so...
	VAR	string Smalltalk24;				// ...laЯ uns lieber ьber was anderes reden...
	//Tough Guy (SLD/MIL/DJG)
	VAR	string Smalltalk25;				// ...der war doch sturzbetrunken...							
	VAR	string Smalltalk26;				// ...mit mir kann man sowas nicht machen...			
	VAR	string Smalltalk27;				// ...alle sind gerannt wie die Hasen, ich war ganz allein...
	//ProInnos (NOV/KDF/PAL)
	VAR	string Smalltalk28;				// ...so steht es in den heiligen Schriften...							
	VAR	string Smalltalk29;				// ...ich handle stets in Innos Namen...			
	VAR	string Smalltalk30;				// ...niemand darf gegen die gцttliche Ordnung verstoЯen...
		
	// ------ Lehrer-Kommentare ------
	var string NoLearnNoPoints			;	//NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string NoLearnOverPersonalMAX	;	//NSC-Lehrer verbietet Steigerung ЬBER sein persцnliches Lehrer-Maximum
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
	var	string Dead				;			// Tцdlich verletzt
	VAR	string Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_3			;			// Treffer kassiert im Kampf	
	
	var string ADDON_WRONGARMOR;			//Sc hat unangemessene Rьstung an				//Default
	var string ADDON_WRONGARMOR_SLD;		//Beide SLD/DJG und falsche Rьstung
	var string ADDON_WRONGARMOR_MIL;		//Beide MIL/PAL	und falsche Rьstung
	var string ADDON_WRONGARMOR_KDF;		//Beide KDF und falsche Rьstung
	var string ADDON_NOARMOR_BDT;			//self ist BAndite und SC hat keine Rьstung an.
	
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
// SVMs mьssen immer "SVM_x" heissen, 
// wobei x die VoiceNummer ist.	
// **********************************

// ------ wird nur intern gebraucht! ------
instance SVM_0 (C_SVM)				
{

};

instance SVM_1 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_1_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_1_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_1_Weather"						;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Сейчас ты получишь!
	DieMonster					=	"SVM_1_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_1_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Сейчас я вышвырну тебя отсюда!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//Что тебе здесь надо, а?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Прекрати немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//Получил, подонок?!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//Я думаю, это научит тебя держаться подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//А теперь убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Оставь меня в покое!
	RunAway						= 	"SVM_1_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ТРЕВОГА!
	Guards						=	"SVM_1_Guards"						;//СТРАЖА!
	Help						=	"SVM_1_Help"						;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//Отлично - одной мерзкой тварью меньше!
	GoodKill					= 	"SVM_1_GoodKill"					;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//Прекрати немедленно, подонок!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Что тебе здесь нужно?! Уходи!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Да, убирайся отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Золото! Хм, золото никогда не помешает...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//У этого ублюдка нет ни гроша в карманах.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Я, пожалуй, заберу твое оружие, так будет безопаснее для тебя же.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Эй! Осторожно!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(агрессивно) Ты мало получил?
	StopMagic					=	"SVM_1_StopMagic"					;//Держись подальше от меня с этой магией!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Убери эту магию! Ты что, оглох?!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Ты что, оглох? Я сказал: Убери оружие!
	WiseMove					=	"SVM_1_WiseMove"					;//Видишь, это было не так уж сложно.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(страстно) Сейчас повеселимся!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(потрясенно) Они лупят друг друга так, что даже страшно...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(дьявольский смех) Он заслужил это!
	NotBad						= 	"SVM_1_NotBad"						;//(одобрительно) Совсем не плохо...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(себе под нос) Какой он жестокий...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Да, как раз то, что нужно!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Чего ты ждешь?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Вот так!
	Ooh01						=	"SVM_1_Ooh01"						;//Не нарушай закон!
	Ooh02						=	"SVM_1_Ooh02"						;//Покажи ему, кто тут главный!
	Ooh03						=	"SVM_1_Ooh03"						;//Черт побери!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Убирайся с моей кровати!
	Awake						= "SVM_1_Awake"							;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Я слышал, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Говорят, ты обратился к Ли и все уладил.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Я не разговариваю с грязными ворами!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Прочь, с глаз моих, грязный вор!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Ты позоришь наш орден! Лорд Хаген будет в ярости!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Ты позоришь городскую стражу! Лорд Андрэ научит тебя хорошим манерам!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Лорд Андрэ узнает о том, что ты сделал!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Отец Парлан не будет рад, когда узнает об этом кощунстве!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Ли задаст тебе трепку! Ты плохо кончишь!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Командующий Гаронд потребует от тебя объяснений!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//Хорошо, хорошо, ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//Тебе еще раз показать, кто тут главный?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 золотых монет.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 золотых монет.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 золотых монет.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 золотых монет.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 золотых монет.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 золотых монет.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 золотых монет.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 золотых монет.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 золотых монет.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 золотых монет.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 золотых монет.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 золотых монет.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 золотых монет.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 золотых монет.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 золотых монет.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 золотых монет.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 золотых монет.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 золотых монет.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 золотых монет.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 золотых монет.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 золотых монет.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 золотых монет.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 золотых монет.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 золотых монет.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 золотых монет.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 золотых монет.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 золотых монет.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...ты действительно думаешь...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...все возможно...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...ему стоило лучше подумать...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...как будто у меня без того проблем не хватает...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...кто сказал тебе это...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...от этого будут одни проблемы...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...ходят разные слухи...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...На твоем месте я бы этого не делал...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...это все слухи...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...я бы не доверял тому, кто тебе это сказал...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...Возможно, я говорил тебе раньше...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...никто никогда не спрашивает меня...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...тебе должно быть жаль этого беднягу...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...нет ничего нового...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...это абсолютно очевидно...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...тебе не стоит спрашивать меня об этом...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...так может продолжаться вечность...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...ты уже знаешь, что я думаю...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...это именно так, как я сказал...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...ничто не изменит это...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...и почему я не слышал об этом раньше...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...посмотрим, что будет дальше...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...некоторые проблемы решаются сами собой...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...Я больше не хочу слышать об этом...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...он напился в стельку...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...Я не позволю так обращаться с собой...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...они все разбежались как крысы, и я остался совсем один...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...так говорится в Писании...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...Я всегда поступаю так, как завещал Иннос...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//...никто не смеет нарушать божественный порядок...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_1_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_1_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_1_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_1_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_1_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Аааааа!
	Aargh_1						= "SVM_1_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_1_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_1_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Это не твоя одежда. Я не буду с тобой разговаривать.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Что ты носишь? Надень что-нибудь приличное.
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Ты солдат! Ну так одевайся как солдат.
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Твоя одежда не соответствует нашему ордену. Пойди и переоденься.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//У тебя нет никаких доспехов. Убирайся!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Умри, грязный разбойник!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Пиратская мразь!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_3_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_3_Weather"					;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Я разорву тебя на куски!
	DieMonster					=	"SVM_3_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Грязный вор! Ну, подожди!
	HandsOff					=	"SVM_3_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Убийца!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Ты не хочешь идти? Хорошо!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Что тебе было нужно там?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Ты заслужил это, подонок!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//Держись подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//А теперь, убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Не трогая меня!
	RunAway						= 	"SVM_3_RunAway"					;//Ох, черт!!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_3_Guards"					;//СТРАЖА!
	Help						=	"SVM_3_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//Отлично - одной мерзкой тварью меньше!
	GoodKill					= 	"SVM_3_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//Да! Беги со всех ног!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Что тебе здесь нужно?! Уходи!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Да, убирайся отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Ах ты сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//Смотри! Еще раз - и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Тебе все еще мало?
	StopMagic					=	"SVM_3_StopMagic"				;//Прекрати это магическое дерьмо!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Хочешь получить? Прекрати немедленно!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_3_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(страстно) Аах, драка!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(дьявольский смех) Ты показал ему, кто здесь главный!
	NotBad						= 	"SVM_3_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Задай ему!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Прекратите, вы!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Покажи ему!
	Ooh01						=	"SVM_3_Ooh01"					;//Держись!
	Ooh02						=	"SVM_3_Ooh02"					;//Осторожно!
	Ooh03						=	"SVM_3_Ooh03"					;//Ох! Какой удар!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_3_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Говорят, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Говорят, ты ходил к Ли и все уладил.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Оставь меня в покое, грязное животное!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Оставь меня в покое, презренный воришка!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Ты позоришь наш орден! Подожди, лорд Хаген узнает об этом!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Ты позоришь городскую стражу! Подожди, лорд Андрэ узнает об этом!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Подожди, лорд Андрэ узнает об этом.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Подожди, отец Парлан узнает об этом!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Подожди, Ли узнает об этом...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Подожди, командующий Гаронд узнает об этом!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Хорошо, хорошо, ты лучший боец. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//Я думаю, что теперь ты прекрасно знаешь, кто из нас сильнее... Чего ты хочешь?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Я думал, ты хочешь сразиться со мной. Ты передумал? Ты предпочитаешь БОЛТАТЬ, да? (смеется)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 золотых монет.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...ты действительно думаешь...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...все возможно...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...ему стоило лучше подумать...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...как будто у меня без этого мало проблем...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...кто сказал тебе это...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...от этого будут одни проблемы...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...ходят разные слухи...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...никогда бы не подумал...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...это все слухи...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...с бы не доверял тому, кто сказал тебе это...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...Возможно, я говорил тебе раньше...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...никто никогда не спрашивает меня...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...тебе должно быть жаль этого беднягу...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...нет ничего нового...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...это абсолютно очевидно...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...тебе не стоит спрашивать меня об этом...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...так может продолжаться вечность...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...ты уже знаешь, что я думаю...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...Я так и сказал...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...ничто не изменит это...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...и почему я не слышал об этом раньше...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...посмотрим, что будет дальше...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...некоторые проблемы решаются сами собой...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...Я больше не хочу слышать об этом...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...он напился в стельку...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...Я не позволю так обращаться с собой...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...они все разбежались как крысы, и я остался совсем один...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...так говорится в Писании...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...Я всегда поступаю так, как завещал Иннос...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...никто не смеет нарушать божественный порядок...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_3_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_3_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_3_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_3_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_3_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Аааааа!
	Aargh_1						= "SVM_3_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_3_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_3_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Что это за одежда? Она совершенно тебе не подходит. Оставь меня в покое.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Если ты хочешь, чтобы с тобой говорили, оденься прилично.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//Мы, солдаты, носим нашу форму с гордостью. Пойди, переоденься.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//В нашем ордене все равны, поэтому мы носим одинаковую форму. Пойди и переоденься!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Ты, похоже, пришел прямо из камеры. Для начала надень что-нибудь приличное.

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//ПОДОЙДИ СЮДА, РАЗБОЙНИК!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//ПОДОЙДИ СЮДА, ПИРАТ!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_4_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_4_Weather"						;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//Опять ТЫ!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Я разорву тебя на куски!
	DieMonster					=	"SVM_4_DieMonster"					;//Еще одна тварь!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ах ты подлый вор!
	HandsOff					=	"SVM_4_HandsOff"					;//Руки прочь!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Эй! Оставь наших овец в покое!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Этот монстр ворует наших овец!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//Что ЭТА тварь делает здесь?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//Сейчас ты получишь!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Ты сам напросился.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Иногда слова не доходят...
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Что тебе там было нужно, а?!
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Прекрати немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Умри!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Тупой ублюдок...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//Получай, грязная тварь!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Держись подальше от моих вещей - понял?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Впредь не распускай руки!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Впредь держись подальше от наших овец!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Даже и не пытайся!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Пусть это послужит тебе уроком.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Вставай и убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Чтобы больше я тебя не видел там - понятно?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Здесь я задаю трепку, понял?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Оставь меня в покое!
	RunAway						= 	"SVM_4_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_4_Guards"					;//СТРАЖА!
	Help						=	"SVM_4_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//Да! Вот как нужно разбираться с этими тварями!
	GoodKill					= 	"SVM_4_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//Ты еще не знаешь, на что я способен!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Прочь!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Что тебе нужно здесь?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Прекрати!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Что ты там ищешь?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(просыпается) В чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Ах ты сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//Смотри! Еще раз, и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(агрессивно) Хочешь еще получить по морде?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Прекрати это магическое дерьмо немедленно!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Хочешь получить? Прекрати немедленно!!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_4_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(страстно) Ах, драка!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(дьявольский смех) Ты показал ему, кто здесь главный!
	NotBad						= 	"SVM_4_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Да, задай ему!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Покажи ему!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Прикончи его!
	Ooh01						=	"SVM_4_Ooh01"					;//Защищайся!
	Ooh02						=	"SVM_4_Ooh02"					;//Вперед, ответь ему!
	Ooh03						=	"SVM_4_Ooh03"					;//Охх! Это больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(себе под нос, просыпаясь) Черт, что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Убирайся с моей кровати!
	Awake						= "SVM_4_Awake"						;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Я слышал, ты обратился к Ли и все уладил.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Хорошо.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Убийство овцы - это уже слишком! Проваливай!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Ты бандит - убирайся!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Проклятый вор! - я не хочу видеть тебя!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Я не ожидал такого от паладина! Лорд Хаген будет недоволен.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Как такой как ты вообще мог попасть в городскую стражу? Лорд Андрэ заставит тебя заплатить за это!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Лорд Андрэ узнает о твоем поведении!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Отец Парлан будет в ярости, узнав о твоем кощунстве!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Ли не простит тебе это!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Командующий Гаронд узнает про это - и ты ответишь за все!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Ну и удар у тебя... Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//Есть еще вопросы?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//Ты опять!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 золотых монет.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...это действительно правда...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...я слышал другое...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...не говори, что ты не знал этого...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...в наши дни даже и не знаешь, кому верить...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...это все сплетни...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...Я сам не лучше...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...и почему это меня не удивляет...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...это не мои проблемы...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...ты действительно веришь в это...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...никто ничему не учится у меня...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...это было всегда очевидно...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...он слушал не тех людей...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...если он этого не видит, я ничем не могу помочь...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...Это не новость...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...он сам бы никогда не додумался...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...это давно известно...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...это плохой бизнес...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...Я бы сделал по-другому...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...Я полностью с тобой согласен...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...если все будет по другому...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...Я даже не знал об этом...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...с этим ничего не поделать...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...это не удивляет меня...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...но он настаивал, что ему лучше знать...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...важна только сила, так что не надо...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...он даже меч толком держать не умел...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...да, он действительно сказал это...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...кто-то должен заплатить за это...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Иннос просвещает тех, кто признает его мудрость...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...правосудие восторжествует...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Мне больше нечему учить тебя. Ты слишком хорош.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_4_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_4_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_4_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_4_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_4_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Аааааа!
	Aargh_1						= "SVM_4_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_4_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_4_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Сначала оденься нормально, тогда мы поговорим.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Лучше надень доспехи, если хочешь поговорить со мной.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Тебе что, не выдали доспехи? Тогда пойди и найди их.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Где твоя одежда? Пойди и переоденься. Только тогда я поговорю с тобой.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Что ты, нищий бродяга, что ли? Возвращайся, когда купишь себе доспехи.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Еще один бандит!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Ах ты, грязный пират!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_5_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_5_Weather"						;//Какая мерзкая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Сейчас ты получишь!
	DieMonster					=	"SVM_5_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_5_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Сейчас я вышвырну тебя отсюда!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Что тебе здесь надо, а?!
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Получил, подонок?!
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//Я думаю, это научит тебя держаться подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//А теперь убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Оставь меня в покое!
	RunAway						= 	"SVM_5_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ТРЕВОГА!
	Guards						=	"SVM_5_Guards"						;//СТРАЖА!
	Help						=	"SVM_5_Help"						;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//Отлично - одной мерзкой тварью меньше!
	GoodKill					= 	"SVM_5_GoodKill"					;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//Прекрати немедленно, подонок!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Что тебе здесь нужно?! Уходи!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Да, убирайся отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Золото! Хм, золото никогда не помешает...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Да у тебя даже нет золота с собой?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Я, пожалуй, заберу твое оружие, так будет безопаснее для тебя же.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Эй! Осторожно!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(агрессивно) Ты мало получил?
	StopMagic					=	"SVM_5_StopMagic"					;//Держись подальше от меня с этой магией!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Убери эту магию! Ты что, оглох?!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Ты что, оглох? Я сказал: Убери оружие!
	WiseMove					=	"SVM_5_WiseMove"					;//Видишь, это было не так уж сложно.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(страстно) Сейчас повеселимся!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(потрясенно) Они лупят друг друга так, что даже страшно...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(дьявольский смех) Он заслужил это!
	NotBad						= 	"SVM_5_NotBad"						;//(одобрительно) Совсем не плохо...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(себе под нос) Какой он жестокий...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Да, как раз то, что нужно!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Чего ты ждешь?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Вот так!
	Ooh01						=	"SVM_5_Ooh01"						;//Не нарушай закон!
	Ooh02						=	"SVM_5_Ooh02"						;//Покажи ему, кто тут главный!
	Ooh03						=	"SVM_5_Ooh03"						;//Черт побери!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Убирайся с моей кровати!
	Awake						= "SVM_5_Awake"							;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Я слышал, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//Я слышал, ты ходил к Ли и все уладил.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Я не разговариваю с грязными ворами!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Прочь с глаз моих, грязный вор!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Ты позоришь наш орден! Лорд Хаген будет в ярости!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Ты позоришь городскую стражу! Лорд Андрэ научит тебя хорошим манерам!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Лорд Андрэ узнает о том, что ты сделал!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Отец Парлан не будет рад, когда узнает об этом кощунстве!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Ли задаст тебе трепку! Ты плохо кончишь!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Командующий Гаронд потребует от тебя объяснений!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//Хорошо, хорошо, ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//Тебе еще раз показать, кто тут главный?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 золотых монет.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 золотых монет.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 золотых монет.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 золотых монет.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 золотых монет.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 золотых монет.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 золотых монет.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 золотых монет.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 золотых монет.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 золотых монет.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 золотых монет.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 золотых монет.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 золотых монет.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 золотых монет.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 золотых монет.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 золотых монет.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 золотых монет.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 золотых монет.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 золотых монет.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 золотых монет.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 золотых монет.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 золотых монет.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 золотых монет.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 золотых монет.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 золотых монет.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 золотых монет.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 золотых монет.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...ты действительно думаешь...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...все возможно...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...ему стоило лучше подумать...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...как будто у меня без того проблем не хватает...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...кто сказал тебе это...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...от этого будут одни проблемы...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...ходят разные слухи...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...На твоем месте я бы этого не делал...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...это все слухи...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...я бы не доверял тому,  кто тебе это сказал...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...Возможно, я говорил тебе раньше...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...никто никогда не спрашивает меня...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...тебе должно быть жаль этого беднягу...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...нет ничего нового...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...это абсолютно очевидно...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...тебе не стоит спрашивать меня об этом...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...так может продолжаться вечность...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...ты уже знаешь, что я думаю...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...это именно так, как я сказал...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...ничто не изменит это...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...и почему я не слышал об этом раньше...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...посмотрим, что будет дальше...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...некоторые проблемы решаются сами собой...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...Я больше не хочу слышать об этом...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...он напился в стельку...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...Я не позволю так обращаться с собой...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...они все разбежались как крысы, и я остался совсем один...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...так говорится в Писании...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...Я всегда поступаю так, как завещал Иннос...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...никто не смеет нарушать божественный порядок...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_5_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_5_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_5_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_5_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_5_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Аааааа!
	Aargh_1						= "SVM_5_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_5_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_5_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Для начала надень что-нибудь соответствующее.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//Что на тебе надето? Ты что, больше не один из нас? Тогда я не буду иметь с тобой дело.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//Мы, солдаты, сражаемся за короля, так что лучше бы тебе надеть его доспехи.
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Зачем тебе выдали доспехи, если ты их все равно не носишь? Подумай об этом.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Что ты за простофиля? У тебя даже нет доспехов. Иди прочь.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Ага, бандит!
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Я порву тебя на части, пират!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_6_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_6_Weather"					;//Паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Сейчас ты у меня получишь!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Тебе не стоило появляться здесь!
	DieMonster					=	"SVM_6_DieMonster"					;//Иди сюда, грязная тварь!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_6_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Оставь наших овец в покое!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Отойди от наших овец, ты, мерзавец !
	YouMurderer					=	"SVM_6_YouMurderer"				;//Убийца!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Ты пожалеешь об этом!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Я предупреждал тебя.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Эй, убирайся отсюда!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Эй! Что тебе было нужно там?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Прекрати! Немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Я выпущу тебе кишки, ублюдок!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Получай...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Эй, я его прикончу!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Я предупреждаю тебя! Не пытайся повторять это, грязный вор!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//Я думаю, это научит тебя держаться подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//И держись подальше от наших овец!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Даже  не пытайся нападать на меня!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Я предупреждал тебя.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//А теперь убирайся!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Я больше не хочу видеть тебя здесь, понял?!
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Никаких драк здесь. Пусть это послужит тебе уроком.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Не пытайся что-нибудь выкинуть!
	RunAway						= 	"SVM_6_RunAway"						;//Я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_6_Guards"					;//СТРАЖА!
	Help						=	"SVM_6_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//Покажи этим тварям, где раки зимуют!
	GoodKill					= 	"SVM_6_GoodKill"				;//Да, покажи этому ублюдку, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//Я тебя еще достану!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Тебе нечего здесь делать!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Да, убирайся!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Что ты задумал? Что ты тут ошиваешься?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(просыпается) Черт, что тебе нужно?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Ну, по крайней мере, у тебя есть золото с собой.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Даже золота нет - пффф...
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Пожалуй, я заберу твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(предупреждающе) Парень! Не делай этого больше!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(агрессивно) Хочешь еще получить?
	StopMagic					=	"SVM_6_StopMagic"				;//Убери эту магию!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Последнее предупреждение! Убери эту магию!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Убери это, иди я за себя не отвечаю!
	WiseMove					=	"SVM_6_WiseMove"				;//Эй, ты не такой тупой, как кажешься!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(себе под нос) Только попробуй сделать это опять...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(себе под нос) Охх! Моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(жадно) А теперь пришло время позабавиться...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(дьявольский смех) Пусть это послужит уроком для него...
	NotBad						= 	"SVM_6_NotBad"					;//(одобрительно) Как он ему дал!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(себе под нос) Какой он жестокий!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Прикончи его!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Не останавливайся!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Прикончи его!
	Ooh01						=	"SVM_6_Ooh01"					;//Осторожно!
	Ooh02						=	"SVM_6_Ooh02"					;//Защищайся же!
	Ooh03						=	"SVM_6_Ooh03"					;//Ох, как больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_6_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Так значит, ты утряс все проблемы с командующим.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Отец Парлан отпустил тебе твои грехи.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Значит, ты ходил к Ли и утряс все проблемы.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Хорошо.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Ты нападаешь на овцу? А ты не хочешь выбрать себе еще более беззащитную жертву?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Я не общаюсь с бандитами!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Я не имею дел с ворами!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//И ты хочешь стать паладином? Подожди, вот лорд Хаген узнает об этом!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Ты действительно состоишь в городской страже? Лорд Андрэ не потерпит такого!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Иди к лорду Андрэ, пока еще не поздно.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Иди к отцу Парлану. Он отпустит тебе твои грехи!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Ли узнает об этом, и тебе придется заплатить.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Командующему Гаронду это не понравится. Тебе лучше поговорить с ним, пока не поздно!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Хорошо, ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//Я думаю, теперь ты понимаешь, с кем ты имеешь дело. Чего ты хочешь?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Опять ты? Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 золотых монет.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...не могу поверить в это...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...Я не был бы так уверен...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...но он все время знал об этом...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...Я теперь даже не знаю, кому верить...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...Я не знаю, где его так отделали...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...У меня и так хватает проблем...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...Я что-то слышал об этом...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...Я не хочу иметь к этому никакого отношения...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...не нужно верить всему, что говорят...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...Он узнал это не от меня...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...Я уже подумывал об этом...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...никому не интересно мое мнение...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...он не заслужил этого...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...не говори, что ты не знал этого...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...это было очевидно...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...где ты это услышал...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...так может продолжаться вечность...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...У меня собственное мнение на этот счет...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...это было так, как ты сказал...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...Я не верю, что это что-то изменит...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...первый раз слышу об этом...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...нам остается только ждать...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...Я знал, что это будет проблемой...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...почему они не слушают меня...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...он бежал так, как будто за ним гнался сам Белиар...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...конечно, в конце концов, мы его поймали...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...ты должен все хорошенько взвесить...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...некоторые даже не знают, насколько они порочны...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...такова воля Инноса...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...его дела были праведными...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_6_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_6_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_6_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_6_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_6_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Аааааа!
	Aargh_1						= "SVM_6_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_6_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_6_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//В этой штуке ты выглядишь смешно. Надень что-нибудь приличное.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Не думаешь ли ты, что я тебя не узнал? Отвали и переоденься.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Солдат! Что на тебе надето? Переоденься. И немедленно!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Слуга Инноса не должен скрываться. Пойди и надень свою робу.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Ты гуляешь тут, как рудокоп. Тебе стоит надеть что-нибудь.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Ты не на того напал, БАНДЮГА!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Возвращайся в море, пират!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_7_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_7_Weather"						;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Опять ТЫ!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Я разорву тебя на куски!
	DieMonster					=	"SVM_7_DieMonster"					;//Еще одна тварь!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ах ты подлый вор!
	HandsOff					=	"SVM_7_HandsOff"					;//Руки прочь!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Эй! оставь наших овец в покое!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Этот монстр ворует наших овец!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//Что ЭТА тварь делает здесь?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Сейчас ты получишь!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Ты сам напросился.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Иногда слова не доходят...
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Что тебе там было нужно, а?!
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Прекрати немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Умри!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Тупой ублюдок...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Получай, грязная тварь!
	ThiefDown					=	"SVM_7_ThiefDown"					;//Держись подальше от моих вещей - понял?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Впредь не распускай руки!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Впредь держись подальше от наших овец!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Не пытайся повторить это, мальчик!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Пусть это послужит тебе уроком.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Вставай и убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Чтобы больше я тебя не видел там! Понятно?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//Здесь я задаю трепку, понял?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Оставь меня в покое!
	RunAway						= 	"SVM_7_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_7_Guards"					;//СТРАЖА!
	Help						=	"SVM_7_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//Да! Вот как нужно разбираться с этими тварями!
	GoodKill					= 	"SVM_7_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//Ты еще не знаешь, на что я способен!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Прочь!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Что тебе нужно здесь?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Прекрати!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Что ты там ищешь?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(просыпается) В чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Ах ты сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//Смотри! Еще раз, и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(агрессивно) Хочешь еще получить по морде?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Прекрати это магическое дерьмо немедленно!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Хочешь получить? Прекрати немедленно!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_7_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(страстно) Ах, драка!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(дьявольский смех) Ты показал ему, кто здесь главный!
	NotBad						= 	"SVM_7_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Да, задай ему!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Покажи ему!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Задай ему!
	Ooh01						=	"SVM_7_Ooh01"					;//Защищайся!
	Ooh02						=	"SVM_7_Ooh02"					;//Вперед, ответь ему!
	Ooh03						=	"SVM_7_Ooh03"					;//Охх! Это больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(себе под нос, просыпаясь) Черт, что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Убирайся с моей кровати!
	Awake						= "SVM_7_Awake"						;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Я слышал, ты обратился к Ли и все уладил.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Хорошо.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Убийство овцы - это уже слишком! Проваливай!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Ты бандит, убирайся!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Проклятый вор! Я не хочу видеть тебя!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Я не ожидал такого от паладина! Лорд Хаген будет недоволен.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Как такой, как ты, вообще мог попасть в городскую стражу? Лорд Андрэ заставит тебя заплатить за это!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Лорд Андрэ узнает о твоем поведении!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Отец Парлан будет в ярости, узнав о твоем кощунстве!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Ли не простит тебе это!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Командующий Гаронд узнает про это - и ты ответишь за все!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Ну и удар у тебя... Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//Есть еще вопросы?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//Ты опять!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 золотых монет.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...это действительно правда...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...я слышал другое...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...не говори, что ты не знал этого...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...в наши дни даже и не знаешь, кому верить...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...это все сплетни...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...Я сам не лучше...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...и почему это меня не удивляет...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...это не мои проблемы...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...ты действительно веришь в это...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...никто ничему не учится у меня...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...это было всегда очевидно...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...он слушал не тех людей...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...если он этого не видит, я ничем не могу помочь...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...Это не новость...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...он сам бы никогда не додумался...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...это давно известно...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...это плохой бизнес...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...Я бы подошел к этому по-другому...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...Я полностью с тобой согласен...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...если все будет по-другому...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...Я даже не знал об этом...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...с этим ничего не поделать...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...это не удивляет меня...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...но он настаивал, что ему лучше знать...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...важна только сила, так что не надо...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...он даже меч толком держать не умел...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...да, он действительно сказал это...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...кто-то должен заплатить за это...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Иннос просвещает тех, кто признает его мудрость...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...правосудие восторжествует...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Мне больше нечему учить тебя. Ты слишком хорош.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_7_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_7_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_7_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_7_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_7_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Аааааа!
	Aargh_1						= "SVM_7_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_7_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_7_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Зачем этот маскарад? Так я не буду с тобой разговаривать.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//Что ты надел? Где твои доспехи? Надень немедленно!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//Это нарушение армейской униформы. Переоденься! Сейчас же!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Советую тебе надеть робу. А пока я не могу разговаривать с тобой и буду лишь молиться за тебя.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Что ты хочешь? Ты не из наших, ты даже не носишь наши доспехи.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Умри, жалкий разбойник!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Умри, презренный пират!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_8_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_8_Weather"					;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Я разорву тебя на куски!
	DieMonster					=	"SVM_8_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Грязный вор! Ну, подожди!
	HandsOff					=	"SVM_8_HandsOff"					;//Убери свои грязные лапы!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Убийца!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Ты не хочешь идти? Хорошо!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Что тебе было нужно там?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Ты заслужил это, подонок!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//Держись подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//А теперь убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Не трогай меня!
	RunAway						= 	"SVM_8_RunAway"					;//Ох, черт!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_8_Guards"					;//СТРАЖА!
	Help						=	"SVM_8_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//Отлично - одной мерзкой тварью меньше!
	GoodKill					= 	"SVM_8_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//Да! Беги, пока можешь!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Что тебе здесь нужно?! Уходи!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Да, убирайся отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Ах ты, сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//Смотри! Еще раз, и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Тебе все еще мало?
	StopMagic					=	"SVM_8_StopMagic"				;//Прекрати это магическое дерьмо!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Хочешь получить? Прекрати немедленно!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_8_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(страстно) А-ах, драка!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(дьявольский смех) Ты показал ему!
	NotBad						= 	"SVM_8_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Задай ему!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Прекратите, вы!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Покажи ему!
	Ooh01						=	"SVM_8_Ooh01"					;//Держись!
	Ooh02						=	"SVM_8_Ooh02"					;//Осторожно!
	Ooh03						=	"SVM_8_Ooh03"					;//О! Как он ему дал!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_8_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Говорят, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Говорят, ты обратился к Ли и все уладил.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Оставь меня в покое, грязное животное!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Оставь меня в покое, презренный воришка!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Ты позоришь наш орден! Подожди, лорд Хаген узнает об этом!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Ты позоришь городскую стражу! Подожди, лорд Андрэ узнает об этом!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Подожди, лорд Андрэ узнает об этом.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Подожди, отец Парлан узнает об этом!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Подожди, Ли узнает об этом...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Подожди, командующий Гаронд узнает об этом!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Хорошо, хорошо, ты лучший боец. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//Я думаю, что теперь ты прекрасно знаешь, кто из нас сильнее... Чего ты хочешь?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Я думал, ты хочешь сразиться со мной. Ты передумал? Ты предпочитаешь БОЛТАТЬ, да? (смеется)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 золотых монет.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...это действительно правда...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...я слышал другое...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...не говори, что ты не знал этого...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...в наши дни даже и не знаешь, кому верить...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...это все сплетни...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...я сам не лучше...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...меня больше ничего не удивляет...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...это не мои проблемы...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...ты действительно веришь в это?..
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...никто ничему не учится у меня...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...это было всегда очевидно...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...он слушал не тех людей...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...если он этого не видит, я ничем не могу помочь...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...это не новость...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...он сам бы никогда не додумался...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...это давно известно...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...это плохой бизнес...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...я бы сделал это по-другому...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...я полностью с тобой согласен...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...если все будет по-другому...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...я даже не знал об этом...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...с этим уже ничего не поделать...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...это не удивляет меня...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...но он настаивал, что ему лучше знать...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...важна только сила, так что не надо...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...он даже меч толком держать не умел...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...да, он действительно сказал это...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...кто-то должен заплатить за это...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Иннос просвещает тех, кто признает его мудрость...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...правосудие восторжествует...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Мне больше нечему учить тебя. Ты слишком хорош.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_8_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_8_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_8_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_8_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_8_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Аааааа!
	Aargh_1						= "SVM_8_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_8_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_8_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Я тебе не верю. Ты как-то не так выглядишь, может быть, дело в одежде.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Судя по тому, как ты выглядишь, ты не из наших. Не буду иметь с тобой дело.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Нам нужно быть заметными. Так что пойди и надень доспехи.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Иннос велит носить его робы с гордостью. Пойди, переоденься.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Я с рудокопами не разговариваю. У тебя даже доспехов нет.

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Ты, грязный разбойник!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//ПИРАТЫ!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_9_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_9_Weather"						;//Паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Тебе не стоило появляться здесь!
	DieMonster					=	"SVM_9_DieMonster"					;//Иди сюда, подлая тварь!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Еще одна тварь!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Там еще одна грязная скотина!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Грязный вор! Ну, подожди!
	HandsOff					=	"SVM_9_HandsOff"					;//Убери свои лапы!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Оставь наших овец в покое!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Держись подальше от наших овец!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Убийца!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Ты пожалеешь об этом!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Я предупреждал тебя!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Я сказал, пошел прочь!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Эй, что ты там делаешь?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Прекрати немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Я проучу тебя, подонок!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//Вот тебе...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze ScheiЯe!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//С тобой покончено, мерзкая тварь!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//ЕЩЕ одним монстром меньше!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Предупреждаю тебя! Держись отсюда подальше, грязный вор!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//Я думаю, это научит тебя держаться подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//И держись подальше от наших овец!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//Что за тупая тварь!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Даже  не пытайся нападать на меня!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Я предупреждал тебя!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//А теперь убирайся!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Я не хочу видеть тебя здесь, понял?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Драки здесь запрещены. Не забывай об этом!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Не делай глупостей!
	RunAway						= 	"SVM_9_RunAway"						;//Я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_9_Guards"					;//СТРАЖА!
	Help						=	"SVM_9_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//Покажи этим тварям, где раки зимуют!
	GoodKill					= 	"SVM_9_GoodKill"				;//Да, покажи этому ублюдку!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//Я тебя достану!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Тебе нечего делать здесь!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Да, проваливай отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Что ты задумал? Что ты тут ошиваешься?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(просыпается) Черт, что тебе нужно?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Ну, по крайней мере, у тебя есть золото с собой.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Даже золота нет - пф-ф-ф.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Пожалуй, я заберу твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(предупреждающе) Парень! Не делай этого больше!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(агрессивно) Хочешь получить еще?
	StopMagic					=	"SVM_9_StopMagic"				;//Убери эту магию!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Последнее предупреждение! Убери эту магию!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Убери это, или я за себя не отвечаю!
	WiseMove					=	"SVM_9_WiseMove"				;//Эй, ты не такой тупой, как кажешься!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(себе под нос) Только еще попробуй...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(себе под нос) Ох! Моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(жадно) А теперь пришло время позабавиться...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(дьявольский смех) Пусть это послужит уроком для него...
	NotBad						= 	"SVM_9_NotBad"					;//(одобрительно) Как он ему дал!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(себе под нос) Какой он жестокий!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Прикончи его!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Не останавливайся!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Прикончи его!
	Ooh01						=	"SVM_9_Ooh01"					;//Осторожно!
	Ooh02						=	"SVM_9_Ooh02"					;//Защищайся же!
	Ooh03						=	"SVM_9_Ooh03"					;//Ох, как больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_9_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Так значит, ты утряс все проблемы с командующим.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Отец Парлан отпустил тебе твои грехи.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Так ты ходил к Ли и все уладил.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Хорошо.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Ты нападаешь на овцу? А ты не хочешь выбрать себе еще более беззащитную жертву?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Я не общаюсь с бандитами!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Я не имею дел с ворами!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//Так ты хочешь стать паладином? Ну, подожди, вот лорд Хаген узнает о твоих делах!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Ты действительно состоишь в городской страже? Лорд Андрэ не потерпит такого!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Иди к лорду Андрэ, пока еще не поздно.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Иди к отцу Парлану. Он отпустит тебе твои грехи!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Ли узнает об этом и тебе придется заплатить.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Командующему Гаронду это не понравится. Тебе лучше поговорить с ним, пока не поздно!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Хорошо, ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//Я думаю, теперь ты понимаешь, с кем ты имеешь дело. Чего ты хочешь?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//Опять ты? Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 золотых монет.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...не могу поверить в это...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...я не был бы так уверен...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...но он все время знал об этом ...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...я теперь даже не знаю, кому верить...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...я не знаю, где его так отделали...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...у меня и так хватает проблем...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...я что-то слышал об этом...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...я не хочу иметь к этому никакого отношения...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...не нужно верить всему, что говорят...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...он узнал это не от меня...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...я уже подумывал об этом...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...никому не интересно мое мнение...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...он не заслужил этого...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...не говори, что ты не знал этого...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...это было очевидно...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...где ты это услышал?..
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...так может продолжаться вечность...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...у меня собственное мнение на этот счет...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...это было так, как ты сказал...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...я не верю, что это что-то изменит...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...первый раз слышу об этом...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...нам остается только ждать...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...я знал, что это будет проблемой...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...почему они не слушают меня?..
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...он бежал так, как будто за ним гнался сам Белиар...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...конечно, в конце концов, мы его поймали...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...ты должен все хорошенько взвесить...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...некоторые даже не знают, насколько они порочны...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...такова воля Инноса...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...его дела были праведными...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Ты хочешь больше, чем я могу научить тебя.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Мне больше нечему учить тебя. Ты уже слишком хорош.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_9_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_9_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_9_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_9_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_9_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Выйдя из храма и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Аааааа!
	Aargh_1						= "SVM_9_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_9_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_9_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Что это за одеяние? Надень что-нибудь, что тебе подходит.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//Что на тебе надето? Ты должен носить свои доспехи!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Ты работаешь на короля, так что тебе следует носить доспехи королевской гвардии. Переоденься.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Твоя одежда не подходит члену нашего ордена. Пойди и переоденься.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//У тебя даже нет доспехов. Отвали!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//Теперь твоя очередь, разбойник!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Тебе не следовало показываться здесь, пират!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_10_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_10_Weather"						;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//Опять ТЫ!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Я разорву тебя на куски!
	DieMonster					=	"SVM_10_DieMonster"					;//Еще одна тварь!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Ах ты, подлый вор!
	HandsOff					=	"SVM_10_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Эй! оставь наших овец в покое!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Этот монстр ворует наших овец!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//Что ЭТА тварь делает здесь?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//Сейчас ты получишь!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Ты сам напросился.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Иногда слова не доходят...
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Что тебе там было нужно, а?!
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Прекрати немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Умри!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Тупой ублюдок...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//Получай, грязная тварь!
	ThiefDown					=	"SVM_10_ThiefDown"					;//В будущем держи свои руки подальше от моих вещей - понял?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Впредь не распускай руки!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Впредь держись подальше от наших овец!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//Что за тупая тварь!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Даже и не пытайся!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Пусть это послужит тебе уроком.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Вставай и убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Чтобы больше я тебя не видел там - понятно?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Здесь я задаю трепку, понял?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Оставь меня в покое!
	RunAway						= 	"SVM_10_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_10_Guards"					;//СТРАЖА!
	Help						=	"SVM_10_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//Да! Вот как нужно разбираться с этими тварями!
	GoodKill					= 	"SVM_10_GoodKill"				;//Эта свинья получила по заслугам!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//Ты еще не знаешь, на что я способен!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Прочь!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Что тебе нужно здесь?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Да, проваливай!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Что ты там ищешь?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(просыпается) В чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Да у тебя даже нет золота с собой!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Я, пожалуй, заберу твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(предупреждающе) Осторожно! Еще раз, и ты поплатишься за это.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(агрессивно) Хочешь еще раз получить по морде?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Прекрати это магическое дерьмо немедленно!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Ты напрашиваешься! Прекрати немедленно!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Убери это оружие!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Да убери же это!
	WiseMove					=	"SVM_10_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(себе под нос) Ну, мы еще посмотрим...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(страстно) А-ах, драка!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(с дьявольским смехом) Ты показал ему!
	NotBad						= 	"SVM_10_NotBad"					;//Неплохо...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Да, задай ему!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Покажи ему!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Прикончи его!
	Ooh01						=	"SVM_10_Ooh01"					;//Защищайся!
	Ooh02						=	"SVM_10_Ooh02"					;//Давай же, отвечай!
	Ooh03						=	"SVM_10_Ooh03"					;//Ох-х! Это больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(себе под нос, просыпаясь) Черт, что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Убирайся с моей кровати!
	Awake						= "SVM_10_Awake"						;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Я слышал, ты обратился к Ли и все уладил.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Это честно.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Убийство овцы - это уже слишком! Проваливай!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Ты бандит - убирайся!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Проклятый вор! - я не хочу видеть тебя!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Я не ожидал такого от паладина! Лорд Хаген будет недоволен.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Как такой, как ты, вообще мог попасть в городскую стражу? Лорд Андрэ заставит тебя заплатить за это!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Лорд Андрэ узнает о твоем поведении!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Отец Парлан будет в ярости, узнав о твоем кощунстве!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Ли не простит тебе это!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Командующий Гаронд узнает про это - и ты ответишь за все!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Ну и удар у тебя... Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//Есть еще вопросы?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//Ты опять!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 золотых монет.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...какая беспечность...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...никто ничего не хочет знать...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...он сам так решил...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...понятия не имею, скажи мне...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...я лучше не буду вмешиваться...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...у меня нет времени на это...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...я бы так не смог...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...лучше не говори, не надо...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...пойди туда, сделай это...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...этого я тебе сказать не могу...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...на это не стоит надеяться...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...я тоже так считаю...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...и это еще не все, поверь мне...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...опять то же самое...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...скажи мне, что это не так...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...рано или поздно это должно было случиться...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...ему стоило сто раз подумать...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...ничего не изменится...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...это не секрет...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...тоже мне, большое дело...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...он думает, это так просто...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...никому это не интересно ...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...и это правда...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...просто послушай, что он говорит...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...если бы он был с нами, все было бы по-другому...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...ему нужно больше тренироваться...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...да что он об этом знает...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Иннос все видит...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...путь добродетели труден и тернист...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...только Иннос знает, что правильно, а что нет...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_10_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_10_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_10_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_10_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_10_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Куда ты направляешься?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть туда, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Аааааа!
	Aargh_1						= "SVM_10_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_10_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_10_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Что на тебе за хлам? Эта одежда тебе не подходит. Оставь меня в покое.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Если ты один из нас, то должен носить нашу форму. Так что пойди и надень ее.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Если уж тебе выданы доспехи королевской гвардии, тебе следует их носить.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Если ты отказываешься от робы, ты отказываешься и от Инноса. Тебе следует задуматься об этом.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Если ты даже не можешь позволить себе доспехи, зачем мне разговаривать с тобой?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Ты, грязный разбойник!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Ты, мерзкий пират!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(кричит) Подожди!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_11_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_11_Weather"						;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Сейчас ты получишь!
	DieMonster					=	"SVM_11_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_11_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_11_SheepKiller"					;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Сейчас я вышвырну тебя отсюда!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Что тебе здесь надо, а?!
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Получил, подонок?!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//В будущем, держи свои руки подальше от чужих вещей!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//А теперь, убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Уходи с миром!
	RunAway						= 	"SVM_11_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ТРЕВОГА!
	Guards						=	"SVM_11_Guards"						;//СТРАЖА!
	Help						=	"SVM_11_Help"						;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//Отлично - одной грязной тварью меньше!
	GoodKill					= 	"SVM_11_GoodKill"					;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//Прекрати немедленно, подонок!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Что тебе здесь нужно!? Уходи!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Да, проваливай отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Золото! Хм, золото никогда не помешает...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Да у тебя даже нет золота с собой?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Я, пожалуй, заберу твое оружие, так будет безопаснее для тебя же.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Эй! Осторожно!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(агрессивно) Ты мало получил?
	StopMagic					=	"SVM_11_StopMagic"					;//Держись подальше от меня с этой магией!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Убери эту магию! Ты что, оглох!?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Ты что, оглох? Я сказал: убери оружие!
	WiseMove					=	"SVM_11_WiseMove"					;//Видишь, это было не так уж сложно.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(страстно) Сейчас повеселимся!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(потрясенно) Они лупят друг друга так, что даже страшно...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(дьявольский смех) Он заслужил это!
	NotBad						= 	"SVM_11_NotBad"						;//(одобрительно) Совсем не плохо...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(себе под нос) Какой он жестокий...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Да, как раз то, что нужно!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Чего ты ждешь?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//Вот так!
	Ooh01						=	"SVM_11_Ooh01"						;//Не нарушай закон!
	Ooh02						=	"SVM_11_Ooh02"						;//Покажи ему, кто тут главный!
	Ooh03						=	"SVM_11_Ooh03"						;//Черт побери!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(себе под нос, просыпаясь) Что это было!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Убирайся с моей кровати!
	Awake						= "SVM_11_Awake"							;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Я слышал, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Говорят, ты обратился к Ли и все уладил.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Я не разговариваю с грязными ворами!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Прочь, с глаз моих, грязный вор!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Ты позоришь наш орден! Лорд Хаген будет в ярости!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Ты позоришь городскую стражу! Лорд Андрэ научит тебя хорошим манерам!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Лорд Андрэ узнает о том, что ты сделал!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Отец Парлан будет недоволен, когда узнает об этом!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Ли задаст тебе трепку! Ты плохо кончишь!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Командующий Гаронд потребует от тебя объяснений!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Хорошо, хорошо, ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//Тебе еще раз показать, кто тут главный?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 золотых монет.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 золотых монет.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 золотых монет.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 золотых монет.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 золотых монет.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 золотых монет.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 золотых монет.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 золотых монет.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 золотых монет.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 золотых монет.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 золотых монет.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 золотых монет.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 золотых монет.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 золотых монет.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 золотых монет.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 золотых монет.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 золотых монет.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 золотых монет.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 золотых монет.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 золотых монет.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 золотых монет.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 золотых монет.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 золотых монет.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 золотых монет.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 золотых монет.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 золотых монет.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 золотых монет.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//... ты действительно думаешь...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//... все возможно...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//... ему стоило лучше подумать...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//... как будто у меня без того проблем не хватает...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//... кто сказал тебе это...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//... от этого будут одни проблемы...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//... ходят разные слухи...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//... На твоем месте я бы этого не делал...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//... это все слухи...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//... я бы не доверял тому,  кто тебе это сказал...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//... Возможно, я говорил тебе раньше...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//... никто никогда не спрашивает меня...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//... тебе должно быть жаль этого беднягу...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//... нет ничего нового...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//... это абсолютно очевидно...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//... тебе не стоит спрашивать меня об этом...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//... так может продолжаться вечность...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//... ты уже знаешь, что я думаю...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//... это именно так, как я сказал...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//... это ничего не изменит...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//... и почему я не слышал об этом раньше...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//... посмотрим, что будет дальше...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//... некоторые проблемы решаются сами собой...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//... Я больше не хочу слышать об этом...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//... он напился в стельку...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//... Я не позволю так обращаться с собой...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//... они все разбежались как крысы, и я остался совсем один...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//... так говорится в писании...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//... Я всегда поступаю так, как завещал Иннос...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//... никто не смеет нарушать божественный порядок...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_11_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_11_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_11_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_11_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_11_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Аааааа!
	Aargh_1						= "SVM_11_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_11_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_11_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Что на тебе за одежда? Она тебе не подходит. Оставь меня в покое.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Будь добр надевать свои доспехи, когда я говорю с тобой. Давай, бегом.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Тебе следует надеть доспехи королевской гвардии. Иди же.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Твоя одежда не соответствует нашему ордену. Пойди и переоденься.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//У тебя даже нет доспехов. Отвали!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Еще один бандит.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//ПИРАТЫ!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_12_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_12_Weather"					;//Паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Тебе не стоило появляться здесь!
	DieMonster					=	"SVM_12_DieMonster"					;//Иди сюда, подлая тварь!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Грязный вор! Ну подожди!
	HandsOff					=	"SVM_12_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Оставь наших овец в покое!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Держись подальше от наших овец!!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Убийца!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Ты пожалеешь об этом!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Я предупреждал тебя!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Я сказал, пошел прочь!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Эй, что ты там делаешь?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Прекрати немедленно!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Я проучу тебя, подонок!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Вот тебе...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//Мне это даже нравится!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//ЕЩЕ одним монстром меньше!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Предупреждаю тебя! Держись отсюда подальше, грязный вор!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//Я думаю, это научит тебя держаться подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//И держись подальше от наших овец!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Что за тупая тварь!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Даже  не пытайся нападать на меня!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Я предупреждал тебя!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//А теперь убирайся!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Я не хочу больше здесь тебя видеть, понял?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Драки здесь запрещены. Не забывай об этом!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Не делай глупостей!
	RunAway						= 	"SVM_12_RunAway"						;//Я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_12_Guards"					;//СТРАЖА!
	Help						=	"SVM_12_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//Покажи этим тварям, где раки зимуют!
	GoodKill					= 	"SVM_12_GoodKill"				;//Да, покажи этому ублюдку!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//Я тебя достану!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Тебе нечего делать здесь!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Да, проваливай отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Что ты задумал? Что ты тут ошиваешься?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(просыпается) Черт, что тебе нужно?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Ну, по крайней мере, у тебя есть золото с собой.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Даже золота нет - пффф.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Пожалуй, я заберу твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(предупреждающе) Парень! Не делай этого больше!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(агрессивно) Хочешь получить еще?
	StopMagic					=	"SVM_12_StopMagic"				;//Убери эту магию!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Последнее предупреждение! Убери эту магию!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Убери это, иди я за себя не отвечаю!
	WiseMove					=	"SVM_12_WiseMove"				;//Эй, ты не такой тупой, как кажешься!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(себе под нос) Только еще попробуй ...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(себе под нос) Охх! Моя голова ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(жадно) А теперь, пришло время позабавиться ...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой ...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(дьявольский смех) Пусть это послужит уроком для него...
	NotBad						= 	"SVM_12_NotBad"					;//(одобрительно) Как он ему дал!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(себе под нос) Какой он жестокий!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Прикончи его!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Не останавливайся!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Прикончи его!
	Ooh01						=	"SVM_12_Ooh01"					;//Осторожно!
	Ooh02						=	"SVM_12_Ooh02"					;//Защищайся же!
	Ooh03						=	"SVM_12_Ooh03"					;//Ох, как больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(себе под нос, просыпаясь) Что это было!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_12_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Так значит, ты утряс все проблемы с командующим.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Отец Парлан отпустил тебе твои грехи.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Так ты ходил к Ли и все уладил.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Хорошо.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Ты нападаешь на овцу? А ты не хочешь выбрать себе еще более беззащитную жертву?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Я не общаюсь с бандитами!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Я не имею дел с ворами!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//Так ты хочешь стать паладином? Ну подожди, вот лорд Хаген узнает о твоих делах!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Ты действительно состоишь в городской страже? Лорд Андрэ не потерпит такого!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Иди к лорду Андрэ, пока еще не поздно.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Иди к отцу Парлану. Он отпустит тебе твои грехи!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Ли узнает об этом и тебе придется заплатить.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Командующему Гаронду это не понравится. Тебе лучше поговорить с ним, пока не поздно!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Хорошо - ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//Я думаю, теперь ты понимаешь, с кем ты имеешь дело. Чего ты хочешь?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//Опять ты? Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 золотых монет.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//... Какая беспечность ...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//... никто ничего не хочет знать ...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//... он сам так решил ...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//... понятия не имею, скажи мне ...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//... Я лучше не буду вмешиваться ...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//... У меня нет времени на это ...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//... Я бы так не смог ...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//... лучше не говори, не надо ...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//... пойди туда, сделай это ...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//... этого я тебе сказать не могу ...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//... на это не стоит надеяться ...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//... Я тоже так считаю ...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//... и это еще не все, поверь мне ...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//... опять то же самое ...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//... скажи мне, что это не так ...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//... рано или поздно это должно было случиться ...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//... ему стоило подумать об этом заранее ...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//... ничего не изменится ...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//... это не секрет ...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//... тоже мне большое дело ...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//... он думает, это так просто ...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//... никому это не интересно  ...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//... и это правда ...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...ты просто послушай ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//... если бы он был с нами, все было бы по-другому ...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//... ему нужно больше тренироваться ...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//... да что он об этом знает ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//... Иннос все видит ...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//... путь добродетели труден и тернист ...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//... только Иннос знает, что правильно, а что нет ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_12_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_12_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_12_GALGEN"					;//Сейчас ты находишься на площади правосудия перед казармами.
	KASERNE						= "SVM_12_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_12_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на площадь правосудия.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на площадь правосудия.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Пройди по переулку от площади правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на площадь правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Аааааа!
	Aargh_1						= "SVM_12_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_12_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_12_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Твоя одежда просто не подходит тебе. Для начала переоденься.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Надень свои доспехи, если хочешь разговаривать со мной.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Солдат должен носить доспехи королевской гвардии, а не что попало! Так что тебе следует переодеться.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Твоя одежда не соответствует нашему ордену. Пойди и переоденься.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Ты даже не можешь купить себе доспехи. Я не разговариваю со слабаками.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Я порву тебе на части, бандюга!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Я порву тебе на части, пират!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_13_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_13_Weather"					;//Какая паршивая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Сейчас ты у меня получишь!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Я разорву тебя на куски!
	DieMonster					=	"SVM_13_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_13_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_13_SheepKiller"				;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Убийца!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Ты не хочешь уходить? Хорошо!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Что тебе было нужно там?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Ты заслужил это, подонок!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//Я думаю, это научит тебя держаться подальше от того, что тебе не принадлежит!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//А теперь убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Не трогай меня!
	RunAway						= 	"SVM_13_RunAway"					;//Ох, черт!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_13_Guards"					;//СТРАЖА!
	Help						=	"SVM_13_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//Отлично - одной мерзкой тварью меньше!
	GoodKill					= 	"SVM_13_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//Да! Беги со всех ног!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Что тебе здесь нужно?! Уходи!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Да, убирайся отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Ах ты, сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//Смотри! Еще раз, и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Тебе все еще мало?
	StopMagic					=	"SVM_13_StopMagic"				;//Прекрати это магическое дерьмо!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Хочешь получить? Прекрати немедленно!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_13_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(страстно) Ах, драка!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(дьявольский смех) Ты показал ему, кто здесь главный!
	NotBad						= 	"SVM_13_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Задай ему!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Прекратите, вы!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Покажи ему!
	Ooh01						=	"SVM_13_Ooh01"					;//Держись!
	Ooh02						=	"SVM_13_Ooh02"					;//Осторожно!
	Ooh03						=	"SVM_13_Ooh03"					;//Ох! Какой удар!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_13_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Говорят, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Говорят, ты обратился к Ли и все уладил.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Оставь меня в покое, грязное животное!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Оставь меня в покое, презренный воришка!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Ты позоришь наш орден! Подожди, лорд Хаген узнает об этом!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Ты позоришь городскую стражу! Подожди, лорд Андрэ узнает об этом!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Подожди, лорд Андрэ узнает об этом.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Подожди, отец Парлан узнает об этом!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Подожди, Ли узнает об этом...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Подожди, командующий Гаронд узнает об этом!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Хорошо, хорошо, ты лучший боец. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//Я думаю, что теперь ты прекрасно знаешь, кто из нас сильнее... Чего ты хочешь?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Я думал, ты хочешь сразиться со мной. Ты передумал? Ты предпочитаешь БОЛТАТЬ, да? (смеется)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 золотых монет.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...какая беспечность...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...никто ничего не хочет знать...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...он сам так решил...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...понятия не имею, скажи мне...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...я лучше не буду вмешиваться...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...у меня нет времени на это...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...я бы так не смог...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...лучше не говори, не надо...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...пойди туда, сделай это...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...этого я тебе сказать не могу...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...на это не стоит надеяться...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...я тоже так считаю...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...и это еще не все, поверь мне...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...опять то же самое...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...скажи мне, что это не так...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...рано или поздно это должно было случиться...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...ему стоило сто раз подумать...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...ничего не изменится...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...это не секрет...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...тоже мне, большое дело...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...он думает, это так просто...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...никому это не интересно ...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...и это правда...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...ты просто послушай...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...если бы он был с нами, все было бы по-другому...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...ему нужно больше тренироваться...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...да что он об этом знает?..
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Иннос все видит...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...путь добродетели труден и тернист...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...только Иннос знает, что правильно, а что нет...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_13_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_13_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_13_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_13_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_13_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Аааааа!
	Aargh_1						= "SVM_13_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_13_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_13_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Что на тебе надето? Это тебе совсем не подходит. Оставь меня в покое.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Ты не носишь свои доспехи... пойди и надень их.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Ты должен гордиться, что можешь носить доспехи королевской гвардии, а ты бегаешь в этих лохмотьях. Иди же!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Почему ты не носишь одежду, соответствующую нашему ордену? Пойди и подумай об этом.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Да у тебя даже нет доспехов! Вали отсюда!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Ты, мерзкий разбойник!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Ты, презренный пират!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_14_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_14_Weather"						;//Какая мерзкая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Сейчас ты получишь!
	DieMonster					=	"SVM_14_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_14_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_14_SheepKiller"					;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Сейчас я вышвырну тебя отсюда!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Что тебе здесь надо, а?!
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//Получил, подонок?!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//В будущем, держи свои руки подальше от чужих вещей!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//А теперь, убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Уходи с миром!
	RunAway						= 	"SVM_14_RunAway"						;//Черт, я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ТРЕВОГА!
	Guards						=	"SVM_14_Guards"						;//СТРАЖА!
	Help						=	"SVM_14_Help"						;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//Отлично - одной мерзкой тварью меньше!
	GoodKill					= 	"SVM_14_GoodKill"					;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//Прекрати немедленно, подонок!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Что тебе здесь нужно!? Уходи!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Да, проваливай отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(просыпается) Черт, в чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Золото! Хм, золото никогда не помешает...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Да у тебя даже нет золота с собой?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Я, пожалуй, заберу твое оружие, так будет безопаснее для тебя же.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Эй! Осторожно!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(агрессивно) Ты мало получил?
	StopMagic					=	"SVM_14_StopMagic"					;//Держись подальше от меня с этой магией!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Убери эту магию! Ты что, оглох?!
	WeaponDown					=	"SVM_14_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Ты слышишь меня? Я сказал: Убери оружие!
	WiseMove					=	"SVM_14_WiseMove"					;//Видишь, это было не так уж сложно.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(себе под нос) Мы еще поговорим об этом...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(страстно) Сейчас повеселимся!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(потрясенно) Они лупят друг друга так, что даже страшно...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(дьявольский смех) Он заслужил это!
	NotBad						= 	"SVM_14_NotBad"						;//(одобрительно) Совсем не плохо...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(себе под нос) Какой он жестокий...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Да, как раз то, что нужно!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Чего ты ждешь?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Вот так!
	Ooh01						=	"SVM_14_Ooh01"						;//Не нарушай закон!
	Ooh02						=	"SVM_14_Ooh02"						;//Покажи ему, кто тут главный!
	Ooh03						=	"SVM_14_Ooh03"						;//Черт побери!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(себе под нос, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Убирайся с моей кровати!
	Awake						= "SVM_14_Awake"							;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Я слышал, ты ходил к командующему и все уладил.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//Я слышал, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Говорят, ты обратился к Ли и все уладил.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Это хорошо.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Он убивает наших овец!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Я не разговариваю с грязными ворами!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Прочь с глаз моих, грязный вор!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Ты позоришь наш орден! Лорд Хаген будет в ярости!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Ты позоришь городскую стражу! Лорд Андрэ научит тебя хорошим манерам!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Лорд Андрэ узнает о том, что ты сделал!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Отец Парлан будет недоволен, когда узнает об этом!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Ли задаст тебе трепку! Ты плохо кончишь!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Командующий Гаронд потребует от тебя объяснений!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Хорошо-хорошо, ты победил. Чего ты хочешь?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//Тебе еще раз показать, кто тут главный?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Хочешь еще раз сразиться со мной, да?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 золотых монет.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 золотых монет.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 золотых монет.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 золотых монет.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 золотых монет.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 золотых монет.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 золотых монет.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 золотых монет.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 золотых монет.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 золотых монет.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 золотых монет.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 золотых монет.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 золотых монет.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 золотых монет.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 золотых монет.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 золотых монет.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 золотых монет.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 золотых монет.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 золотых монет.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 золотых монет.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 золотых монет.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 золотых монет.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 золотых монет.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 золотых монет.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 золотых монет.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 золотых монет.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 золотых монет.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...я не верю в это...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...я не был бы так уверен...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...но он все время знал об этом...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...я теперь даже не знаю, кому верить...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...я не знаю, где его так отделали...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...у меня и так хватает проблем...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...я что-то слышал об этом...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...я не хочу иметь к этому никакого отношения...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...не нужно верить всему, что говорят...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...он узнал это не от меня...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...я уже подумывал об этом...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...никому не интересно мое мнение...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...он не заслужил этого...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...не говори, что ты не знал этого...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...это было очевидно...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...где ты это услышал?..
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...так может продолжаться вечность...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...у меня собственное мнение на этот счет...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...это было так, как ты сказал...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...я не верю, что это что-то изменит...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...я первый раз слышу об этом...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...нам остается только ждать...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...я знал, что это будет проблемой...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...почему они не слушают меня?..
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...он бежал так, как будто за ним гнался сам Белиар...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...конечно, мы его потом поймали...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...ты должен все хорошенько взвесить...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...некоторые даже не знают, насколько они порочны...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...такова воля Инноса...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...его дела были праведными...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_14_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_14_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_14_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_14_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_14_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Аааааа!
	Aargh_1						= "SVM_14_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_14_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_14_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Твоя одежда выглядит на тебе странно. Должно быть, ты что-то скрываешь. Оставь меня в покое.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Если ты хочешь, чтобы я с тобой говорил, тебе следует надеть наши доспехи.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Гордись тем, что ты в армии, и не бегай в этих лохмотьях. Пойди, переоденься.
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Твоя одежда не соответствует нашему ордену. Пойди и переоденься.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//У тебя даже нет доспехов. Вали отсюда!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Умри, разбойник.
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Умри, пират.
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Эй, ты!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//Эй, ты!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//Эй!
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//Эй!
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Подожди минутку!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Не получается.
	PickBroke				= 	"SVM_15_PickBroke"					;//Хм, сломано.
	NeedKey					= 	"SVM_15_NeedKey"					;//Здесь мне нужен ключ ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//У меня больше нет отмычек ...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Я не умею открывать замки отмычкой.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//На подметание этих келий у меня уйдет целая вечность!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Хм... у меня нет отмычки или ключа.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Мне никогда не открыть это без правильного ключа!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Здесь бы пригодилась отмычка!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Я никогда не смогу открыть этот замок!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//И как я это сделаю?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Хм... Нет ...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Там ничего нет ...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Там ничего нет...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Нечего взять...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Аааааа!
	Aargh_2					=	"SVM_15_Aargh_2"					;//Аааааа!
	Aargh_3					=	"SVM_15_Aargh_3"					;//Аааааа!
	Dead					=	"SVM_15_Dead"						;//Аааааа!
	Awake					=	"SVM_15_Awake"						;//(просыпается)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Ммм. Так вот ты где скрываешься. Чертовски далеко. Ммм. Чтобы добраться туда, мне понадобится корабль.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Иннос, даруй мне свою помощь и очисти этот алтарь.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Иннос, даруй мне свою помощь и все такое ... Вот так. Надеюсь, это было последний раз.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//ХАРАК БЕНДАРО! Ох. Книга открылась. Там внутри лежит письмо и ключ.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//КАДОШ ЭМЕМ КАДАР! Откройся!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Давай займемся делом.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Покажи мне товары.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Покажи мне, что у тебя есть.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Ага.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ага. Кажется, я кое-что нашел.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Я не понимаю...
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Я не могу этого прочесть!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//АХАНТАР!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//ДЖЕР-ЭДРА!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//УРИЗЕЛЬ РАТИС!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(кашляет) О, черт. Брр...
	HUI						=	"SVM_15_Addon_HUI"						;//Ой-ой-ой!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Что ты знаешь о покушении на Эстебана?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//По поводу нападения на Эстебана...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Я убью этих предателей.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Я ищу этих ребят, чтобы выступить против Эстебана.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Ты нужен в шахте.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Игориат Торул! Явись ко мне, Куарходрон, древний предводитель касты воинов!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Хм-м... Кажется, здесь это не работает.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Что мне следует знать о добыче золота?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Ага. Учетная книга Фрэнсиса. Похоже, этот парень прикарманил много золота.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//ДЖЕР-ЭДРА АХАНТАР!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_16_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_16_Weather"						;//Какая мерзкая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//Я все-таки достала тебя!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Сейчас ты получишь!
	DieMonster					=	"SVM_16_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_16_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_16_SheepKiller"					;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Сейчас я вышвырну тебя отсюда!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Что тебе здесь надо, а?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//Получил, подонок?!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//В будущем, держи свои руки подальше от чужих вещей!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//А теперь, убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Не трогай меня!
	RunAway						= 	"SVM_16_RunAway"						;//Я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_16_Guards"					;//СТРАЖА!
	Help						=	"SVM_16_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//Отлично!
	GoodKill					= 	"SVM_16_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//Прекрати немедленно! Трус!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Что тебе здесь нужно!? Уходи!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Да, проваливай отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(просыпается) В чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Ах ты, сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//Смотри! Еще раз, и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Тебе все еще мало?
	StopMagic					=	"SVM_16_StopMagic"				;//Прекрати это магическое дерьмо!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Прекрати немедленно!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_16_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(про себя) Мы еще посмотрим...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(про себя) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(страстно) А-ах, драка!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(дьявольский смех) Ты показал ему, кто здесь главный!
	NotBad						= 	"SVM_16_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(по себя) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Убей его!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Покажи ему, где раки зимуют!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Да, задай ему!
	Ooh01						=	"SVM_16_Ooh01"					;//Обороняйся!
	Ooh02						=	"SVM_16_Ooh02"					;//Осторожно!
	Ooh03						=	"SVM_16_Ooh03"					;//Ох! Это, наверное, больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(про себя, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_16_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Говорят, ты ходил к командующему и все уладил.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Говорят, ты ходил к Ли и все уладил.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Это хорошо.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Ты убивал наших овец! Убирайся!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Ты грубое животное, я не хочу иметь с тобой никаких дел!
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Я не разговариваю с ворами - уходи!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Ты опозорил себя своим поведением. Лорду Хагену это не понравится!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Ты позоришь своим поведением городскую стражу! Лорд Андрэ потребует от тебя объяснений!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Лорд Андрэ узнает о том, что ты сделал!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Ты неправильно вел себя. Иди к отцу Парлану и покайся.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Ли узнает о том, что ты сделал и накажет тебя!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Командующий Гаронд потребует от тебя объяснений!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 золотых монет.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...правда? Как интересно...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...я не верю в это...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...мой муж думает по-другому...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...ладно, не говори мне об этом...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...я видела это сама...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...ты хочешь сказать...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...не говори об этом никому...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...совсем жизни не стало...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...кто это сказал?..
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...если бы я не видела это собственными глазами...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...кто-то должен делать это...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...я слышала другое...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...как это типично для него, правда?..
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...ему нельзя доверять...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...ему лучше заткнуться...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...он почти не отдыхает...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...он не может угодить всем...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...он слишком много болтает...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...это секрет...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...все об этом знают...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...я ей больше ничего не скажу...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...все будет только хуже...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...но это ужасно...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...я всегда это говорила...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_16_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_16_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_16_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_16_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_16_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Аааааа!
	Aargh_1						= "SVM_16_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_16_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_16_Aargh_3"					;//Аааааа!
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Надень что-нибудь приличное. Мне просто неприятно видеть тебя в таком хламе.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//БАНДИТ!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//ПИРАТ!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//За короля!
	PALGreetings				=	"SVM_17_PALGreetings"				;//За Инноса!
	Weather						= 	"SVM_17_Weather"						;//Какая мерзкая погода!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//Я все-таки достал тебя!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Сейчас ты получишь!
	DieMonster					=	"SVM_17_DieMonster"					;//Еще одной грязной твари настал конец!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Грязный воришка! Ну, подожди!
	HandsOff					=	"SVM_17_HandsOff"					;//Убери свои грязные руки!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Этот кусок дерьма убивает наших овец!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Этот мерзкий монстр ворует наших овец!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Убийца!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Зверям здесь не место!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Ну, подожди, сукин сын!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Ты сам напросился!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Сейчас я вышвырну тебя отсюда!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Что тебе здесь надо, а?!
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Ты прекратишь?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Умри, подонок!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//Получил, подонок?!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Еще одним монстром стало меньше!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Даже не пытайся воровать у меня!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//В будущем, держи свои руки подальше от чужих вещей!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Никогда больше так не делай! Это наши овцы!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Умри, убийца!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//Тупая тварь!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Даже не пытайся поднимать оружие против меня!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Тебе стоило послушать меня!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//А теперь убирайся отсюда!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//И больше не попадайся мне на глаза!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Драки здесь запрещены, понятно? Пусть это будет тебе уроком!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Не трогай меня!
	RunAway						= 	"SVM_17_RunAway"						;//Я ухожу отсюда!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ТРЕВОГА!
	Guards						=	"SVM_17_Guards"					;//СТРАЖА!
	Help						=	"SVM_17_Help"					;//Помогите!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//Отлично!
	GoodKill					= 	"SVM_17_GoodKill"				;//Да, покажи этой свинье, где раки зимуют!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Оставь меня в покое!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//Прекрати! Трус!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Что тебе здесь нужно!? Уходи!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Да, проваливай отсюда!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Эй, ты, что тебе здесь нужно?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(просыпается) В чем дело?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Спасибо за золото, герой!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Ах ты, сосунок, у тебя даже золота с собой нет!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Я думаю, лучше забрать твое оружие.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//Смотри! Еще раз, и ты пожалеешь об этом.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Тебе все еще мало?
	StopMagic					=	"SVM_17_StopMagic"				;//Прекрати это магическое дерьмо!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Прекрати немедленно!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Убери оружие!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Ты уберешь это чертово оружие?!
	WiseMove					=	"SVM_17_WiseMove"				;//Умный мальчик!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(себе под нос) Мы еще посмотрим...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(себе под нос) Ох, моя голова...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(страстно) А-ах, драка!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(потрясенно) Ох, бог мой, драка!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(дьявольский смех) Ты показал ему, кто здесь главный!
	NotBad						= 	"SVM_17_NotBad"					;//(одобрительно) Неплохо...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(себе под нос) Бог мой! Какая жестокость...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Задай ему!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Покажи ему, где раки зимуют!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Да, задай ему!
	Ooh01						=	"SVM_17_Ooh01"					;//Обороняйся!
	Ooh02						=	"SVM_17_Ooh02"					;//Осторожно!
	Ooh03						=	"SVM_17_Ooh03"					;//Ох! Это, наверное, больно!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(про себя, просыпаясь) Что это было?!
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Убирайся с моей кровати!
	Awake						= "SVM_17_Awake"					;//(зевает)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Говорят, ты ходил к командующему и все уладил.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Говорят, ты ходил к отцу Парлану и искупил свои грехи.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Говорят, ты ходил к Ли и все уладил.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Это хорошо.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Ты убивал наших овец! Убирайся!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Ты грубое животное, я не хочу иметь с тобой никаких дел.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Я не разговариваю с ворами - уходи!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Ты опозорил себя своим поведением. Лорду Хагену это не понравится!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Ты позоришь своим поведением городскую стражу! Лорд Андрэ потребует от тебя объяснений!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Лорд Андрэ узнает о том, что ты сделал!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Ты неправильно вел себя. Иди к отцу Парлану и покайся.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Ли узнает о том, что ты сделал и накажет тебя!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Командующий Гаронд потребует от тебя объяснений!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 золотых монет.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 золотых монет.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 золотых монет.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 золотых монет.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 золотых монет.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 золотых монет.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 золотых монет.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 золотых монет.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 золотых монет.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 золотых монет.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 золотых монет.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 золотых монет.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 золотых монет.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 золотых монет.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 золотых монет.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 золотых монет.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 золотых монет.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 золотых монет.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 золотых монет.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 золотых монет.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 золотых монет.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 золотых монет.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 золотых монет.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 золотых монет.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 золотых монет.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 золотых монет.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 золотых монет.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 золотых монет.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...правда? Как интересно...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...я не верю в это...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...мой муж думает по-другому...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...ладно, не говори мне об этом...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...я видела это сама...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...ты хочешь сказать...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...не говори об этом никому...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...совсем жизни не стало...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...кто это сказал?..
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...если бы я не видела это собственными глазами...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...кто-то должен делать это...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...я слышала другое...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...как это типично для него, правда?..
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...ему нельзя доверять...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...ему лучше заткнуться...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...он почти не отдыхает...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...он не может угодить всем...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...он слишком много болтает...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...это секрет...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...все об этом знают...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...я ей больше ничего не скажу...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...все будет только хуже...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...но это ужасно...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...я всегда это говорила...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Возвращайся, когда у тебя будет больше опыта.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Тебе нужно больше, чем я в состоянии научить тебя.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Я больше ничему не могу научить тебя. Ты стал слишком хорош.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Понимаешь, ты уже лучше меня...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Сейчас ты находишься в нижней части города.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Сейчас ты находишься в верхней части города.
	TEMPEL						= "SVM_17_TEMPEL"					;//Сейчас ты находишься в храме.
	MARKT						= "SVM_17_MARKT"						;//Сейчас ты находишься на рыночной площади.
	GALGEN						= "SVM_17_GALGEN"					;//Сейчас ты находишься на Площади Правосудия перед казармами.
	KASERNE						= "SVM_17_KASERNE"					;//Это казармы.
	HAFEN						= "SVM_17_HAFEN"						;//Сейчас ты находишься в портовом квартале.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Куда ты хочешь попасть?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Пройди через внутренние ворота, и ты окажешься в нижней части города.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//От южных ворот города начинается лестница, ведущая к внутренним городским воротам. Там и начинается верхний квартал.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Пройди через проход у кузницы, и ты попадешь на храмовую площадь.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Иди по дороге от кузницы вниз, и ты попадешь в порт.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//От храмовой площади в нижнюю часть города ведет проход.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Встань лицом к храму, а затем иди влево, вдоль городской стены. Так ты попадешь на рынок.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Выйдя из храма, и пройдя мимо таверны слева, ты попадешь на Площадь Правосудия.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Пройдя вдоль высокой городской стены от рынка, ты попадешь в храм.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Это огромное здание - казармы. Чтобы попасть в них, просто поднимись по лестнице от отеля.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Просто пройди мимо казарм, и ты попадешь на Площадь Правосудия.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Пройди по переулку от Площади Правосудия, и ты попадешь на храмовую площадь.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Просто пройди мимо казарм, и ты попадешь на рыночную площадь.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Это огромное здание - казармы. Просто поднимись по лестнице.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Просто спустись по лестнице слева от главного входа, и ты попадешь на рыночную площадь.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Просто спустись по лестнице справа от главного входа, и ты попадешь на Площадь Правосудия.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Иди вверх по дороге от гавани, и ты попадешь в нижнюю часть города.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//Аааааа!
	Aargh_1						= "SVM_17_Aargh_1"					;//Аааааа!
	Aargh_2						= "SVM_17_Aargh_2"					;//Аааааа!
	Aargh_3						= "SVM_17_Aargh_3"					;//Аааааа!
	
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(шипит) Вот он!
	RunCoward    	= "SVM_19_RunCoward"    	;//(шипит) Мы до тебя доберемся!
	Dead      		= "SVM_19_Dead"      	;//Аааааа!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Аааааа!
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Аааааа!
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Аааааа!
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




