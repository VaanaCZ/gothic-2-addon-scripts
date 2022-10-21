// **************************
// AIVAR-Kennungen für Humans 
// **************************

// ------ NEWS und MEMORY Aivars ------
// - NUR Augenzeugen
// - NUR persönliches News-Gedächtnis, geregelt über die folgenden Aivars
// - schwere Tat überschreibt leichte Tat
// - KEINE automatische News-Verbreitung, AIV-Check bei aNSCs in Dialogen = Ersatz für News-Verbreitung
// - News-Vergabe über Dialog-Module

const int 	AIV_LastFightAgainstPlayer		= 0;
const int 		FIGHT_NONE				= 0;
const int 		FIGHT_LOST				= 1;	//in ZS_Unconscious
const int 		FIGHT_WON				= 2;	//in ZS_Unconscious (player)
const int 		FIGHT_CANCEL			= 3;	//in B_Attack, wenn other = Player

const int 	AIV_NpcSawPlayerCommit			= 1;
const int 		CRIME_NONE				= 0;
const int 		CRIME_SHEEPKILLER		= 1;
const int 		CRIME_ATTACK			= 2;	//Kampf self-SC --> feinere Analys in DIA-Modul über AIV_LastFightAgainstPlayer
const int 		CRIME_THEFT				= 3;
const int 		CRIME_MURDER			= 4;

const int 	AIV_NpcSawPlayerCommitDay		= 2;

// ------ B_AssessTalk -------------------------
const int 	AIV_NpcStartedTalk				= 3; 	//wenn der NSC mit Important Info den SC anquatscht

// ------ ZS_Talk ------------------------------
const int   AIV_INVINCIBLE					= 4;	//ist TRUE für beide Teilnehmer eines Dialogs
const int 	AIV_TalkedToPlayer				= 5;	

// ------ Pickpocket ---------------------------
const int 	AIV_PlayerHasPickedMyPocket		= 6;

// ------ ZS_Attack ----------------------------
const int	AIV_LASTTARGET					= 7;	//damit other erhalten bleibt
const int 	AIV_PursuitEnd					= 8;    //wenn Verfolgung abgebrochen

// ------ B_SayAttackReason --------------------
const int	AIV_ATTACKREASON				= 9;	//Grund des Angriffs - Reihenfolge PRIORISIERT
const int		AR_NONE					= 0;
const int 		AR_LeftPortalRoom		= 1;			//Spieler hat (unbefugten) Portalraum verlassen
const int 		AR_ClearRoom			= 2;			//Spieler ist unbefugt in meinem Raum
const int		AR_GuardCalledToRoom	= 3;
const int 		AR_MonsterVsHuman		= 4; 			//Monster kämpft gegen Human - ich helfe Human
const int 		AR_MonsterMurderedHuman = 5;			//Monster hat Human getötet
const int 		AR_SheepKiller			= 6;			//Schaf wurde angegriffen oder getötet (von Mensch oder Monster)
const int 		AR_Theft				= 7;			//Spieler hat Item geklaut
const int 		AR_UseMob				= 8;			//Spieler hat an Mob mit Besitzflag rumgefummelt (kann JEDES Mob sein)
const int 		AR_GuardCalledToThief 	= 9;       
const int 		AR_ReactToWeapon		= 10;			//Täter hat trotz zweimaliger Warnung Waffe nicht weggesteckt ODER ich fliehe direkt
const int 		AR_ReactToDamage		= 11;   	 	//Täter hat mich verletzt
const int 		AR_GuardStopsFight		= 12;   	 	//Wache beendet Kampf, greift Täter an
const int 		AR_GuardCalledToKill	= 13;   	 	//Wache durch WARN zum Mit-Töten gerufen
const int 		AR_GuildEnemy			= 14;   	 	//Gilden-Feind = Mensch oder Monster
const int 		AR_HumanMurderedHuman	= 15;   	 	//other hat gemordet
const int 		AR_MonsterCloseToGate 	= 16;   	 	//GateGuards halten nicht-feindliches Monster auf
const int		AR_GuardStopsIntruder	= 17;   	 	//GateGuards attackieren Eindringling
const int 		AR_SuddenEnemyInferno	= 18;			//EnemyOverride Blockierung für mich selbst und alle NPCs im Umkreis aufheben.
const int 		AR_KILL					= 19;   	 	//Spieler aus Dialog heraus töten (SC hat keine Chance)

// ------ ZS_RansackBody ------------------------
const int 	AIV_RANSACKED					= 10; 	//damit nur EIN NSC einen Body plündert

// ------ ZS_Dead -------------------------------
const int 	AIV_DeathInvGiven				= 11;	// Für Mensch und Monster!

// ------ TA_GuardPassage -----------------------
const int	AIV_Guardpassage_Status			= 12;	// Enthält den Status einer Durchgangswache
const int		GP_NONE					= 0;		// ...Anfang; SC noch nicht in der Nähe
const int		GP_FirstWarnGiven		= 1;		// ...nach der ersten Warnung an den SC
const int 		GP_SecondWarnGiven		= 2;		// ...nach der zweiten Warnung an den SC 
const int	AIV_LastDistToWP				= 13;	// enthält die letzte ermittelte Distanz zum Referenz-Waypoint (Checkpoint) (wird beim SPIELER gesetzt!) 
const int   AIV_PASSGATE					= 14;   // TRUE = Spieler kann durch, FALSE = Spieler wird aufgehalten

// ------ XP-Vergabe ----------------------------
const int	AIV_PARTYMEMBER					= 15;	//für XP-Vergabe, AUCH für Monster
const int 	AIV_VictoryXPGiven				= 16;	//wenn NSC schonmal besiegt, gibts keine XP mehr für den Spieler (z.B. bei unconscious Humans)

// ------ Geschlecht ----------------------------
const int AIV_Gender						= 17; 	//wird zusammen mit Visual über B_SetVisual gesetzt
const int 		MALE					= 0;
const int 		FEMALE					= 1;

// ------ TA_Stand_Eating -----------------------
const int AIV_Food							= 18;
const int 		FOOD_Apple				= 0;
const int 		FOOD_Cheese				= 1;
const int 		FOOD_Bacon				= 2;
const int 		FOOD_Bread				= 3;

// ------  TA Hilfsvariable -----------------------	//notwendig da lokale Hilfsvariablen anscheinend nicht immer neu initialisiert werden bitte nur für TAs verwenden!
const int AIV_TAPOSITION					= 19;
const int		ISINPOS					= 0;
const int		NOTINPOS				= 1;
const int 		NOTINPOS_WALK			= 2;

// ------ Finger weg!
const int AIV_SelectSpell					= 20;

// ------ ZS_ObservePlayer ---------------------
const int AIV_SeenLeftRoom					= 21;	//ist Player-aus-Raum-raus-Kommentar schon abgelassen worden?

////////////////////////////////////
var int Player_SneakerComment;
var int Player_LeftRoomComment;
var int Player_DrawWeaponComment;
var int Player_GetOutOfMyBedComment;
////////////////////////////////////

// ------ ZS_Attack ----------------------------
const int AIV_HitByOtherNpc					= 22;	//ANDERER GEGNER - zweiter Treffer
const int AIV_WaitBeforeAttack				= 23;
const int AIV_LastAbsolutionLevel			= 24; 

// ----------------------------------------------
const int AIV_ToughGuyNewsOverride			= 25;


// ***************************
// AIVAR-Kennungen für Monster
// ***************************

const int AIV_MM_ThreatenBeforeAttack		= 26;
const int AIV_MM_FollowTime 				= 27;	//wie lange verfolgt einen das Monster
const int 		FOLLOWTIME_SHORT		= 5;
const int 		FOLLOWTIME_MEDIUM		= 10;
const int 		FOLLOWTIME_LONG			= 20;
const int AIV_MM_FollowInWater 				= 28;	//AUCH für HUMANS! - folgt einem der NSC auch in Wasser?
// ----------------------------------------------
const int AIV_MM_PRIORITY 					= 29;	//ist meine Priorität gerade FRESSEN oder KÄMPFEN (immer fressen, es sei denn ich werde getroffen)
const int 	PRIO_EAT 					= 0;
const int 	PRIO_ATTACK 				= 1;
// ----------------------------------------------
const int AIV_MM_SleepStart 				= 30;
const int AIV_MM_SleepEnd 					= 31;
const int AIV_MM_RestStart 					= 32;
const int AIV_MM_RestEnd 					= 33;		
const int AIV_MM_RoamStart 					= 34;
const int AIV_MM_RoamEnd 					= 35;
const int AIV_MM_EatGroundStart 			= 36;
const int AIV_MM_EatGroundEnd 				= 37;
const int AIV_MM_WuselStart 				= 38;
const int AIV_MM_WuselEnd 					= 39;
const int AIV_MM_OrcSitStart				= 40;
const int AIV_MM_OrcSitEnd					= 41;
const int 	OnlyRoutine 				= -1;
// ----------------------------------------------
const int AIV_MM_ShrinkState 				= 42;	//merkt sich das Schrumpf-Stadium des Monsters, wenn es von einem Shrink-Zauber getroffen wird
// ----------------------------------------------
const int AIV_MM_REAL_ID					= 43;
const int 	ID_MEATBUG					= 1; 				 
const int 	ID_SHEEP					= 2; 
const int 	ID_GOBBO_GREEN				= 3; 	
const int 	ID_GOBBO_BLACK				= 4;
const int 	ID_GOBBO_SKELETON			= 5; 	
const int 	ID_SUMMONED_GOBBO_SKELETON 	= 6;
const int 	ID_SCAVENGER				= 7;
const int 	ID_SCAVENGER_DEMON			= 8; 	
const int 	ID_GIANT_RAT				= 8; 
const int 	ID_GIANT_BUG				= 9; 
const int 	ID_BLOODFLY					= 10; 
const int 	ID_WARAN					= 11; 				
const int	ID_FIREWARAN				= 12;
const int 	ID_WOLF						= 13; 				
const int 	ID_WARG						= 14;
const int 	ID_SUMMONED_WOLF			= 15;
const int 	ID_MINECRAWLER				= 16; 	
const int 	ID_MINECRAWLERWARRIOR		= 17; 	
const int 	ID_LURKER					= 18;
const int 	ID_SKELETON					= 19;
const int 	ID_SUMMONED_SKELETON		= 20;
const int 	ID_SKELETON_MAGE			= 21;
const int 	ID_ZOMBIE					= 22;
const int 	ID_SNAPPER					= 23; 
const int 	ID_DRAGONSNAPPER			= 24; 	
const int 	ID_SHADOWBEAST				= 25; 
const int 	ID_SHADOWBEAST_SKELETON		= 26; 
const int 	ID_HARPY					= 27; 
const int 	ID_STONEGOLEM				= 28; 
const int 	ID_FIREGOLEM				= 29;
const int 	ID_ICEGOLEM					= 30;
const int 	ID_SUMMONED_GOLEM			= 31;
const int 	ID_DEMON					= 32; 
const int 	ID_SUMMONED_DEMON			= 33;
const int 	ID_DEMON_LORD				= 34;
const int 	ID_TROLL					= 35;
const int 	ID_TROLL_BLACK				= 36;
const int 	ID_SWAMPSHARK				= 37; 	
const int 	ID_DRAGON_FIRE				= 38;
const int 	ID_DRAGON_ICE				= 39; 
const int 	ID_DRAGON_ROCK				= 40; 
const int 	ID_DRAGON_SWAMP				= 41; 
const int 	ID_DRAGON_UNDEAD			= 42; 
const int 	ID_MOLERAT					= 43;
const int 	ID_ORCWARRIOR				= 44;
const int 	ID_ORCSHAMAN				= 45;
const int 	ID_ORCELITE					= 46;
const int 	ID_UNDEADORCWARRIOR			= 47;
const int 	ID_DRACONIAN				= 48;
const int 	ID_WISP						= 49;

//----- Addon ------

const int 	ID_Alligator				= 50;
const int 	ID_Swampgolem				= 51;
const int 	ID_Stoneguardian			= 52;
const int 	ID_Gargoyle					= 53;
const int 	ID_Bloodhound				= 54;
const int 	ID_Icewolf					= 55;
const int	ID_OrcBiter					= 56;
const int   ID_Razor					= 57;
const int 	ID_Swarm					= 58;
const int 	ID_Swamprat					= 59;
const int	ID_BLATTCRAWLER				= 60;
const int	ID_SummonedGuardian			= 61;
const int	ID_SummonedZombie			= 62;
const int	ID_Keiler					= 63;
const int 	ID_SWAMPDRONE				= 64;


// ----------------------------------------------
const int AIV_LASTBODY						= 44;	//der Body, an dem ich zuletzt gefressen habe




// **********************
// Weitere Human - AIVARs
// **********************

// ------ Petzen --------------------------------
const int AIV_ArenaFight					= 45;
const int 	AF_NONE						= 0;
const int 	AF_RUNNING					= 1;
const int 	AF_AFTER					= 2;
const int 	AF_AFTER_PLUS_DAMAGE		= 3;

// ------ zusätzlich zur CRIME merken -----------
const int AIV_CrimeAbsolutionLevel			= 46;

// ------ ZS_Attack ----------------------------
const int AIV_LastPlayerAR					= 47;

// ------ ZS_Unconscious ------------------------
const int AIV_DuelLost						= 48;

// ------ Trade AIV -----------------------------
const int AIV_ChapterInv					= 49;

// ------ Monster: Rudeltier (reagiert auf WARN) ------
const int AIV_MM_Packhunter					= 50;

// ------ MAGIE -----
const int AIV_MagicUser						= 51;
const int 	MAGIC_NEVER					= 0;
const int 	MAGIC_ALWAYS				= 1;

// ------ C_DropUnconscious ------
const int AIV_DropDeadAndKill				= 52;

// ------ ZS_MagicFreeze ------
const int AIV_FreezeStateTime				= 53;

// ------ IGNORE Crime ------
const int AIV_IGNORE_Murder					= 54;
const int AIV_IGNORE_Theft					= 55;
const int AIV_IGNORE_Sheepkiller			= 56;

// ------ ToughGuy IGNORIERT Attack-Crime ------
const int AIV_ToughGuy						= 57;	//Jubelt beim Kampf, hat keine News bei Attack (kann über AIV_LastFightAgainstPlayer reagieren)

// ------ News Override (petzen aber nicht labern) ------
const int AIV_NewsOverride					= 58;

// ------ ZS_MM_Attack ------
const int AIV_MaxDistToWp					= 59;
const int AIV_OriginalFightTactic			= 60;

// ------ B_AssessEnemy ------
const int AIV_EnemyOverride					= 61;

// ------ für beschworene Monster ------
const int AIV_SummonTime					= 62;

// ------ ZS_Attack ------
const int AIV_FightDistCancel				= 63;
const int AIV_LastFightComment				= 64; //Hat der NSC den letzten Kampf kommentiert?

// -----------------------
const int AIV_LOADGAME						= 65; //frag nicht

// ------ ZS_Unconscious -------
const int AIV_DefeatedByPlayer				= 66;

// ------ ZS_Dead ------
const int AIV_KilledByPlayer				= 67;

// ------ diverse ZS -------
const int AIV_StateTime						= 68; //um mit zwei StateTime-Triggern arbeiten zu können.

// -------------------------
const int AIV_Dist							= 69;

const int AIV_IgnoresFakeGuild				= 70;

const int AIV_NoFightParker					= 71;	//wird von NSCs weder angegriffen, noch greift er selber welche an. (Archetyp: Gefangener)
const int AIV_NPCIsRanger					= 72;	//Der Typ gehört zum 'Ring des Wassers'
const int AIV_IgnoresArmor					= 73;	//Keine Reaktion oder Konsequenzen auf die Rüstung des SC
const int AIV_StoryBandit					= 74;	//Banditen, mit denen gekämpft werden darf
const int AIV_StoryBandit_Esteban			= 75;	//Estebans Dreigestirn

// ------ ZS_Whirlwind --------
const int AIV_WhirlwindStateTime			= 76;	//added by kairo

// ------ ZS_Inflate --------
const int AIV_InflateStateTime				= 77;	//added by kairo

// ------ ZS_Swarm --------
const int AIV_SwarmStateTime				= 78;	//added by kairo

// ------ ZS_SuckEnergy	--------
const int AIV_SuckEnergyStateTime			= 79;	//added by kairo

// ------ Party of Pirates ------
const int AIV_FollowDist					= 80;	

// ------ REAL Attributes ------
const int REAL_STRENGTH						= 81;
const int REAL_DEXTERITY					= 82;
const int REAL_MANA_MAX						= 83;
const int REAL_TALENT_1H					= 84;
const int REAL_TALENT_2H					= 85;
const int REAL_TALENT_BOW					= 86;
const int REAL_TALENT_CROSSBOW				= 87;

const int AIV_SpellLevel 					= 88;

// ***************************************************
// Globalvariablen für Petzen/Absolution/News - System
// ***************************************************

var int ABSOLUTIONLEVEL_OldCamp;
var int ABSOLUTIONLEVEL_City;
var int ABSOLUTIONLEVEL_Monastery;
var int ABSOLUTIONLEVEL_Farm;
var int ABSOLUTIONLEVEL_BL;//ADDON

var int PETZCOUNTER_OldCamp_Murder;
var int PETZCOUNTER_OldCamp_Theft;
var int PETZCOUNTER_OldCamp_Attack;
var int PETZCOUNTER_OldCamp_Sheepkiller;

var int PETZCOUNTER_City_Murder;
var int PETZCOUNTER_City_Theft;
var int PETZCOUNTER_City_Attack;
var int PETZCOUNTER_City_Sheepkiller;

var int PETZCOUNTER_Monastery_Murder;
var int PETZCOUNTER_Monastery_Theft;
var int PETZCOUNTER_Monastery_Attack;
var int PETZCOUNTER_Monastery_Sheepkiller;

var int PETZCOUNTER_Farm_Murder;
var int PETZCOUNTER_Farm_Theft;
var int PETZCOUNTER_Farm_Attack;
var int PETZCOUNTER_Farm_Sheepkiller;

var int PETZCOUNTER_BL_Murder;
var int PETZCOUNTER_BL_Theft;
var int PETZCOUNTER_BL_Attack;

// ***************************************************
// Location Konstanten
// ***************************************************

const int LOC_NONE		= 0;
const int LOC_OLDCAMP	= 1;
const int LOC_CITY		= 2;
const int LOC_MONASTERY = 3;
const int LOC_FARM		= 4;
const int LOC_BL		= 5;	//Addon Banditenlager
const int LOC_ALL		= 6;	//ALLE Locations


// ***************************************************
// Stadtviertel Konstanten
// ***************************************************

const int Q_KASERNE 	= 1;
const int Q_GALGEN 		= 2;
const int Q_MARKT 		= 3;
const int Q_TEMPEL 		= 4;
const int Q_UNTERSTADT 	= 5;
const int Q_HAFEN 		= 6;
const int Q_OBERSTADT 	= 7;


// ******************************
// Aktive Wahrnehmung der MONSTER
// ******************************
//---------------------------------------------
const int PERC_DIST_SUMMONED_ACTIVE_MAX	= 2000;	// Maximale Reichweite der aktiven Wahrnehmung aller beschworenen Monster
const int PERC_DIST_MONSTER_ACTIVE_MAX	= 1500; // Maximale Reichweite der aktiven Wahrnehmung ALLER anderen Monster
const int PERC_DIST_ORC_ACTIVE_MAX		= 2500; // 
const int PERC_DIST_DRAGON_ACTIVE_MAX	= 3500; //Damit das Vlippern endlich ein Ende hat
//---------------------------------------------
const int FIGHT_DIST_MONSTER_ATTACKRANGE = 700;	// Wann greifen Monster an bzw. ab welcher Distanz vertreiben sie dich vom Fressen
const int FIGHT_DIST_MONSTER_FLEE		= 300;	// Ab wann fliehe ich vor einem Feind
const int FIGHT_DIST_DRAGON_MAGIC		= 700;
//---------------------------------------------
const int MONSTER_THREATEN_TIME			= 4; 	// Sekunden, die Monster drohen, bevor sie angreifen (wenn Gegner nicht zu weit und nicht zu nah)
const int MONSTER_SUMMON_TIME			= 60;

/********************************************************************
**					Konstanten für Distanzen					   **
**					    der Menschen-AI							   **
********************************************************************/
// --------------------------------------------
const int TA_DIST_SELFWP_MAX			= 500; // 500
// --------------------------------------------
const int PERC_DIST_ACTIVE_MAX			= 2000;	// Maximal-Reichweite der AKTIVEN Wahrnehmungen - angegeben in Npc_Default.d
//---------------------------------------------
const int PERC_DIST_INTERMEDIAT			= 1000; // Mittlere Passive Wahrnehmung
const int PERC_DIST_DIALOG				= 500;	// Dialogreichweite
const int PERC_DIST_HEIGHT				= 1000; // ab welchem Höhenunterschied wird Wn ignoriert
const int PERC_DIST_INDOOR_HEIGHT		= 250;  // dasselbe für Indoor (zum Ignorieren von anderen Stockwerken wenn ganzes Haus (Höhlensystem) EIN Portalraum ist)
//---------------------------------------------
const int FIGHT_DIST_MELEE				= 600;	// Bis zu welcher Entfernung Bedrohung durch SC-Waffe
const int FIGHT_DIST_RANGED_INNER		= 900;  // Ab welcher Entfernung NK wählen, wenn NSC im FK ist
const int FIGHT_DIST_RANGED_OUTER		= 1000; // Ab welcher Entfernung FK wählen, wenn NSC im NK ist oder Waffe zum ersten Mal gezogen wird
const int FIGHT_DIST_CANCEL				= 3500; // Bis wann hinterherschiessen, ab welcher Distanz Kampf abbrechen ODER Flucht abbrechen
//---------------------------------------------
const int WATCHFIGHT_DIST_MIN			= 300;
const int WATCHFIGHT_DIST_MAX			= 2000;
//---------------------------------------------
const int ZivilAnquatschDist 			= 400;	// Distanz, ab der dich ein NSC zivil anspricht (Maximum ist PERC_DIST_ACTIVE_MAX --> B_AssessPlayer)

//---------------------------------------------
const float RANGED_CHANCE_MINDIST		= 1500;	// Unterhalb dieser Distanz steigt die Trefferchance linear bis 100% an. (Default sind 10m)
const float RANGED_CHANCE_MAXDIST		= 4500; // Ab RANGED_CHANCE_MINDIST bis RANGED_CHANCE_MAXDIST sinkt die Trefferchance bis auf 0% ab (default sind 100m)


/********************************************************************
**					Zeit-Konstanten									*
********************************************************************/
CONST INT NPC_ANGRY_TIME 				= 120;	// MUSS SO HEISSEN, ist vom Programm ausgelagert - Spielsekunden, die die Temp_Att aufrechterhalten wird, bevor sie wieder auf Perm_Att gesetzt wird (gilt für alle At, nicht nur für angry)
// -------------------------------------------
const int HAI_TIME_UNCONSCIOUS			= 20;	// MUSS SO HEISSEN, ist vom Programm ausgelagert (Default = 20) - Zeit in Sekunden, die der SC und NSCs bewußtlos bleiben
// -------------------------------------------
const int NPC_TIME_FOLLOW				= 10;	// Zeit, die sich das Opfer des NSCs maximal in BS_RUN befinden darf, um noch weiter verfolgt zu werden



/********************************************************************
**	Mindestschaden 				                                   **
********************************************************************/
const int NPC_MINIMAL_DAMAGE 	= 5; 	//MUSS SO HEISSEN, ist vom Programm ausgelagert - Untere Genze des Mindestschadens für Menschen (*** und Monster ??? ***)
const int NPC_MINIMAL_PERCENT	= 10;	//MUSS SO HEISSEN, ist vom Programm ausgelagert - Mindestschaden wird ermittelt durch X% vom normalen Gesamtschaden (NACH Abzug der Rüstung), wobei NPC_MINIMAL_DAMAGE genommen wird, falls Mindestschaden NACH %-Berechnung kleiner als NPC_MINIMAL_DAMAGE!


/********************************************************************
**					Fight AI-Constanten								*
********************************************************************/

const int FAI_HUMAN_COWARD				= 2		;
const int FAI_HUMAN_NORMAL				= 42	;
const int FAI_HUMAN_STRONG				= 3		;
const int FAI_HUMAN_MASTER				= 4		;
//-----------------------------------------------
const int FAI_MONSTER_COWARD			= 10	; 	// Spielanfang
//-----------------------------------------------
const int FAI_NAILED					= 1		;
//-----------------------------------------------
const int FAI_GOBBO						= 7		; 	// Green Goblin / Black Goblin
const int FAI_SCAVENGER					= 15	; 	// (bei Bedarf) Scavenger / Evil Scavenger
const int FAI_GIANT_RAT					= 11	; 
const int FAI_GIANT_BUG					= 31	; 
const int FAI_BLOODFLY					= 24	; 
const int FAI_WARAN						= 21	; 	// Waren / Feuerwaran					
const int FAI_WOLF						= 22	; 	
const int FAI_MINECRAWLER				= 5		; 	// Minecrawler / Minecrawler Warrior
const int FAI_LURKER					= 9		;
const int FAI_ZOMBIE					= 23	;
const int FAI_SNAPPER					= 18	; 	// Snapper / Dragon Snapper
const int FAI_SHADOWBEAST				= 16	; 
const int FAI_HARPY						= 36	; 
const int FAI_STONEGOLEM				= 8 	; 
const int FAI_DEMON						= 6		; 
const int FAI_TROLL						= 20 	; 	// Troll / Schwarzer Troll
const int FAI_SWAMPSHARK				= 19	; 	// (bei Bedarf) 
const int FAI_DRAGON					= 39	; 	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
const int FAI_MOLERAT					= 40	; 	// Molerat
//-----------------------------------------------
const int FAI_ORC						= 12	;	// Ork-Krieger / Ork-Shamane / Ork-Elite
const int FAI_DRACONIAN					= 41 	; 				

//Alles Addon

const int FAI_Alligator					= 43	;	//Alligator Addon
const int FAI_Gargoyle					= 44	;   //Steinpuma
const int FAI_Bear						= 45	; 	//Bär
const int FAI_Stoneguardian				= 46	;	//Steinwächter

/********************************************************************
**					Allgemeine Konstanten						   **
********************************************************************/
const int TRUE				= 1;
const int FALSE				= 0;

const INT LOOP_CONTINUE 	= 0;
CONST INT LOOP_END			= 1;

const int DEFAULT 			= 0; //wird in Monster-Instanzen (SetVisual) verwendet


// ***************************
// 		Spieler Constants
// ***************************

const int LP_PER_LEVEL				= 10;	// Lernpunkte pro Spieler-Stufe
const int HP_PER_LEVEL				= 12;	// Lebenspunkte pro Spieler-Stufe

const int XP_PER_VICTORY			= 10;	// Erfahrungspunkte pro Level des Gegners


/********************************************************************
**					NPC-Typ											*
********************************************************************/

const int NPCTYPE_AMBIENT		= 0;
const int NPCTYPE_MAIN			= 1;
const int NPCTYPE_FRIEND		= 2;
const int NPCTYPE_OCAMBIENT		= 3;
const int NPCTYPE_OCMAIN		= 4;
const int NPCTYPE_BL_AMBIENT	= 5;//Addon
const int NPCTYPE_TAL_AMBIENT	= 6;//Addon
const int NPCTYPE_BL_MAIN		= 7;//Addon

//****************************************************
//		Produktions-Mobsis
//****************************************************

//werden benötigt um eine Unterscheidung der Mobsi beim PC_Hero Dialog vorzunehmen.

const int 	MOBSI_NONE						= 0;
const int	MOBSI_SmithWeapon				= 1;
const int	MOBSI_SleepAbit					= 2;
const int	MOBSI_MakeRune					= 3;
const int	MOBSI_PotionAlchemy				= 4;
const int	MOBSI_PRAYSHRINE				= 5;	
const int	MOBSI_GOLDHACKEN				= 6;
const int	MOBSI_PRAYIDOL					= 7;

var int 	PLAYER_MOBSI_PRODUCTION;

// *****************************
// Konstanten für B_SetNpcVisual
// *****************************

// ------ Nacktmesh-Texturen für Männer und Frauen (je 4) ------
const int BodyTex_P			= 0;	//Pale
const int BodyTex_N			= 1;	//Normal
const int BodyTex_L			= 2;	//Latino
const int BodyTex_B			= 3;	//Black 	- die gleichen Kennungen haben auch die Gesichter (zum direkten Vergleich)
const int BodyTexBabe_P		= 4;	//Pale Babe
const int BodyTexBabe_N		= 5;	//Normal Babe	
const int BodyTexBabe_L		= 6;	//Latino Babe 
const int BodyTexBabe_B		= 7;	//Black Babe   //Frauen werden auch mit den "Männer"-Konstanten angegeben, dann vom Script +4 addiert, d.h. diese Konstanten werden nicht gebraucht
const int BodyTex_Player	= 8;

//---------ADD ON----------------------
const int BodyTex_T	= 10; //tätowierte psionikerhaut
const int BodyTexBabe_F	= 11; //Fellkragen Babe 
const int BodyTexBabe_S	= 12;//das kleine Schwarze 


// ------ Keine Rüstung ------
const int NO_ARMOR			= -1;

// ------- Gesichter für Männer ------
const int Face_N_Gomez 				=	0	;
const int Face_N_Scar 				= 	1	;
const int Face_N_Raven				= 	2	;
const int Face_N_Bullit				= 	3	;	//zu lieb!
const int Face_B_Thorus				= 	4	;
const int Face_N_Corristo			= 	5	;
const int Face_N_Milten				= 	6	;
const int Face_N_Bloodwyn			= 	7	;	//zu lieb!
const int Face_L_Scatty				= 	8	;
const int Face_N_YBerion			= 	9	;
const int Face_N_CoolPock			= 	10	;
const int Face_B_CorAngar			= 	11	;
const int Face_B_Saturas			= 	12	;
const int Face_N_Xardas				= 	13	;
const int Face_N_Lares				= 	14	;
const int Face_L_Ratford			= 	15	;
const int Face_N_Drax				= 	16	;	//Buster
const int Face_B_Gorn				= 	17	;
const int Face_N_Player				= 	18	;
const int Face_P_Lester				= 	19	;
const int Face_N_Lee				= 	20	;
const int Face_N_Torlof				= 	21	;
const int Face_N_Mud				= 	22	;
const int Face_N_Ricelord			= 	23	;
const int Face_N_Horatio			= 	24	;
const int Face_N_Richter			= 	25	;
const int Face_N_Cipher_neu			= 	26	;
const int Face_N_Homer				= 	27	;	//Headmesh thief
const int Face_B_Cavalorn			= 	28	;
const int Face_L_Ian				= 	29	;
const int Face_L_Diego				= 	30	;
const int Face_N_MadPsi				= 	31	;
const int Face_N_Bartholo			= 	32	;
const int Face_N_Snaf				= 	33	;
const int Face_N_Mordrag			= 	34	;
const int Face_N_Lefty				= 	35	;
const int Face_N_Wolf				= 	36	;
const int Face_N_Fingers			= 	37	;
const int Face_N_Whistler			= 	38	;
const int Face_P_Gilbert			= 	39	;
const int Face_L_Jackal				= 	40	;

//Pale
const int Face_P_ToughBald			= 	41	;
const int Face_P_Tough_Drago		= 	42	;
const int Face_P_Tough_Torrez		= 	43	;
const int Face_P_Tough_Rodriguez	= 	44	;
const int Face_P_ToughBald_Nek		= 	45	;
const int Face_P_NormalBald 		= 	46	;
const int Face_P_Normal01			= 	47	;
const int Face_P_Normal02			= 	48	;
const int Face_P_Normal_Fletcher	= 	49	;
const int Face_P_Normal03			= 	50	;
const int Face_P_NormalBart01		= 	51	;
const int Face_P_NormalBart_Cronos	= 	52	;
const int Face_P_NormalBart_Nefarius= 	53	;
const int Face_P_NormalBart_Riordian= 	54	;
const int Face_P_OldMan_Gravo		= 	55	;
const int Face_P_Weak_Cutter		= 	56	;
const int Face_P_Weak_Ulf_Wohlers	= 	57	;

//Normal
const int Face_N_Important_Arto		= 	58	;
const int Face_N_ImportantGrey		= 	59	;
const int Face_N_ImportantOld		= 	60	;
const int Face_N_Tough_Lee_ähnlich	= 	61	;
const int Face_N_Tough_Skip			= 	62	;
const int Face_N_ToughBart01		= 	63	;
const int Face_N_Tough_Okyl			= 	64	;
const int Face_N_Normal01			= 	65	;
const int Face_N_Normal_Cord		= 	66	;
const int Face_N_Normal_Olli_Kahn	= 	67	;	
const int Face_N_Normal02			= 	68	;
const int Face_N_Normal_Spassvogel	= 	69	;
const int Face_N_Normal03			= 	70	;
const int Face_N_Normal04			= 	71	;
const int Face_N_Normal05			= 	72	;
const int Face_N_Normal_Stone		= 	73	;
const int Face_N_Normal06			= 	74	;
const int Face_N_Normal_Erpresser	= 	75	;
const int Face_N_Normal07			= 	76	;
const int Face_N_Normal_Blade		= 	77	;
const int Face_N_Normal08			= 	78	;
const int Face_N_Normal14			= 	79	;
const int Face_N_Normal_Sly			= 	80	;
const int Face_N_Normal16			= 	81	;
const int Face_N_Normal17			= 	82	;
const int Face_N_Normal18			= 	83	;
const int Face_N_Normal19			= 	84	;
const int Face_N_Normal20			= 	85	;
const int Face_N_NormalBart01		= 	86	;
const int Face_N_NormalBart02		= 	87	;
const int Face_N_NormalBart03		= 	88	;
const int Face_N_NormalBart04		= 	89	;
const int Face_N_NormalBart05		= 	90	;
const int Face_N_NormalBart06		= 	91	;
const int Face_N_NormalBart_Senyan	= 	92	;
const int Face_N_NormalBart08		= 	93	;
const int Face_N_NormalBart09		= 	94	;
const int Face_N_NormalBart10		= 	95	;
const int Face_N_NormalBart11		= 	96	;
const int Face_N_NormalBart12		= 	97	;
const int Face_N_NormalBart_Dexter	= 	98	;
const int Face_N_NormalBart_Graham	= 	99	;
const int Face_N_NormalBart_Dusty	= 	100	;
const int Face_N_NormalBart16		= 	101	;
const int Face_N_NormalBart17		= 	102	;
const int Face_N_NormalBart_Huno	= 	103	;
const int Face_N_NormalBart_Grim	= 	104	;
const int Face_N_NormalBart20		= 	105	;
const int Face_N_NormalBart21		=	106	;
const int Face_N_NormalBart22		= 	107	;
const int Face_N_OldBald_Jeremiah	= 	108	;
const int Face_N_Weak_Ulbert		= 	109	;
const int Face_N_Weak_BaalNetbek	= 	110	;
const int Face_N_Weak_Herek			= 	111	;
const int Face_N_Weak04				= 	112	;
const int Face_N_Weak05				= 	113	;
const int Face_N_Weak_Orry			= 	114	;
const int Face_N_Weak_Asghan		= 	115	;
const int Face_N_Weak_Markus_Kark	= 	116	;
const int Face_N_Weak_Cipher_alt	= 	117	;
const int Face_N_NormalBart_Swiney 	= 	118	;
const int Face_N_Weak12				= 	119	;

//Latinos
const int Face_L_ToughBald01		= 	120	;
const int Face_L_Tough01			= 	121	;
const int Face_L_Tough02			= 	122	;
const int Face_L_Tough_Santino		= 	123	;
const int Face_L_ToughBart_Quentin	=	124	;
const int Face_L_Normal_GorNaBar	= 	125	;
const int Face_L_NormalBart01		= 	126	;
const int Face_L_NormalBart02		= 	127	;
const int Face_L_NormalBart_Rufus	= 	128	;

//Black
const int Face_B_ToughBald			= 	129	;
const int Face_B_Tough_Pacho		= 	130	;
const int Face_B_Tough_Silas		= 	131	;
const int Face_B_Normal01			= 	132	;
const int Face_B_Normal_Kirgo		= 	133	;
const int Face_B_Normal_Sharky		= 	134	;
const int Face_B_Normal_Orik		= 	135	;
const int Face_B_Normal_Kharim		= 	136	;

// ------ Gesichter für Frauen ------

const int FaceBabe_N_BlackHair		= 	137	;
const int FaceBabe_N_Blondie		= 	138	;
const int FaceBabe_N_BlondTattoo	= 	139	;
const int FaceBabe_N_PinkHair		= 	140	;
const int FaceBabe_L_Charlotte		= 	141	;
const int FaceBabe_B_RedLocks		= 	142	;
const int FaceBabe_N_HairAndCloth	= 	143	;
//
const int FaceBabe_N_WhiteCloth		= 	144	;
const int FaceBabe_N_GreyCloth		= 	145	;
const int FaceBabe_N_Brown			= 	146	;
const int FaceBabe_N_VlkBlonde		= 	147	;
const int FaceBabe_N_BauBlonde		= 	148 ;
const int FaceBabe_N_YoungBlonde	= 	149	;
const int FaceBabe_N_OldBlonde		= 	150 ;
const int FaceBabe_P_MidBlonde		= 	151 ;
const int FaceBabe_N_MidBauBlonde	= 	152 ;
const int FaceBabe_N_OldBrown		= 	153 ;
const int FaceBabe_N_Lilo			= 	154 ;
const int FaceBabe_N_Hure			= 	155 ;
const int FaceBabe_N_Anne			= 	156 ;
const int FaceBabe_B_RedLocks2		= 	157	;
const int FaceBabe_L_Charlotte2		= 	158 ;


//-----------------ADD ON---------------------------------
const int Face_N_Fortuno		= 	159;

//Piraten
const int Face_P_Greg		= 	160;
const int Face_N_Pirat01	= 	161;
const int Face_N_ZombieMud	= 	162;

