PROTOTYPE C_Spell_Proto(C_Spell) 
{
	time_per_mana				=	500;			// Zeit pro investierten Manapunkt (ms)
	damage_per_level			=	1;				// Schaden pro Level
	damageType					=	DAM_MAGIC;		// CAN BE ONLY ONE DAMAGE TYPE
	spellType					=	SPELL_BAD;		// Good, Neutral or Bad
	canTurnDuringInvest			=	1;
	canChangeTargetDuringInvest	=	1;
	isMultiEffect				=	0;				// Effect Class is oCVisFX_MultiTarget if set to 1 (e.g. the effect can have multiple trajectorys (massdeath)
	targetCollectAlgo			=	TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType			=	TARGET_TYPE_NPCS;
	targetCollectRange			=	10000;		
	targetCollectAzi			=	60;
	targetCollectElev			=	60;
};

// Spells, die gecastet werden solange man die Tasten gedrückt hält

// Auf Programm-Seite ist das Aufrechterhalten des Spells aber die INVEST-Phase!! 
// Das bedeutet, daß die Damage_per_Level Angabe in der Spells_Params.d erst beim stoppen (eigentlich CASTEN) 
// des Spells aufgerufen wird! Der Abzug von Schaden beim Opfer muß also im zs_"Victim"-Script des Opfers erfolgen...

/* */





/*

SPL_DONTINVEST 			// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
SPL_RECEIVEINVEST		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
SPL_SENDCAST			// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
SPL_SENDSTOP			// Beende Zauber ohne Effekt
SPL_NEXTLEVEL			// setze den Spruch auf den nächsten Level

TARGET_COLLECT_NONE 					// target will be set by effect (range, azi, elev)
TARGET_COLLECT_CASTER					// target is the caster
TARGET_COLLECT_FOCUS 					// target is the focus vob
TARGET_COLLECT_ALL 						// all targets in range will be assembled

TARGET_COLLECT_FOCUS_FALLBACK_NONE		// target is the focus vob, if the focus vob is not valid, the trajectory will be set by the effect
TARGET_COLLECT_FOCUS_FALLBACK_CASTER	// target is the focus vob, if the focus vob is not valid, the target is the caster

TARGET_COLLECT_ALL_FALLBACK_NONE		// all targets in range will be assembled, if there are no valid targets, the trajectory will be set by the effect
TARGET_COLLECT_ALL_FALLBACK_CASTER		// all targets in range will be assembled, if there are no valid targets, the target is the caster



CONST INT TARGET_TYPE_ALL						= 1;
CONST INT TARGET_TYPE_ITEMS						= 2;
CONST INT TARGET_TYPE_NPCS						= 4;
CONST INT TARGET_TYPE_ORCS						= 8;
CONST INT TARGET_TYPE_HUMANS					= 16;
CONST INT TARGET_TYPE_UNDEAD					= 32;
*/
