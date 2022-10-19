// *************************************
// NSC - Wahrnehmungsreichweiten
// *************************************

FUNC VOID InitPerceptions()
{
	// Die Reichweite der aktiven Wahrnehmungen
	// PERC_ASSESSPLAYER	// Spieler wird wahrgenommen
	// PERC_ASSESSENEMY		// der nächste NSC, zu dem ich Att_Hostile habe, wird wahrgenommen! (wenn Temp_Att != Gil_Att, wird Temp_att genommen)

	// PERC_ASSESSBODY		// JEDER Tote wird wahrgenommen / z.Zt. nur in Monster-AI

		// PERC_ASSESSFIGHTER	// Spieler mit gezogener Waffe / Spruch wird wahrgenommen / ALLE Monster werden wahrgenommen (sind immer im Fightmode)
		// PERC_ASSESSITEM		// JEDES Item wird wahrgenommen
	// wird durch den senses_range = PERC_DIST_ACTIVE_MAX gesetzt.

	// *** ACHTUNG *** Die Reihenfolge der aktiven Wn bestimmt, welche zuerst gecheckt und (bei Erfolg) aufgerufen wird - der Rest wird IGNORIERT!
	// Aktive Wahrnehmungen werden NUR über die aktivierten senses getriggert -Humans haben KEIN sense_smell, d.h. ein Aufruf von z.B. B_AssessPlayer beinhaltet schon einen Sichtcheck (etwa 180° vor dem NSC)

	// *** ACHTUNG *** Passive Wahrnehmungen sind sense-unabhängig (sie gehen immer an alle NSCs, egal ob's gesehen/gehört wird oder nicht)

	// --- KAMPF -----------------------------------------------------------------

	Perc_SetRange		(PERC_ASSESSDAMAGE		, 9999							); //Reichweite wird nicht vom Programm benutzt!
	// wird an den NSC gesendet, der getroffen worden ist
	Perc_SetRange		(PERC_ASSESSOTHERSDAMAGE, PERC_DIST_INTERMEDIAT			); //wird i.d.R. nur von Monster-AI benutz (einige ZS) und lokal in ZS_WatchFight
	// wird an alle NSCs gesendet, wenn ein NSC getroffen worden ist
	Perc_SetRange		(PERC_ASSESSDEFEAT		, WATCHFIGHT_DIST_MAX			); //wird NUR in ZS_WatchFight (lokal) benutzt
	// wird an alle NSCs gesendet, wenn ein NSC bewußtlos wird
	Perc_SetRange		(PERC_ASSESSMURDER		, PERC_DIST_ACTIVE_MAX 			); //eigentlich INTERMEDIAT, ist hier größer, weil Mörder direkt hinter mir, aber Opfer 11m entfernt stehen kann
	// wird an alle NSCs gesendet, wenn ein NSC stirbt
	Perc_SetRange		(PERC_ASSESSTHREAT		, PERC_DIST_INTERMEDIAT			); //BUG!  Reichweite interessiert hier vermutlich nicht --Mike
	// wird alle 2 Sekunden an den NSC gesendet, auf den der Spieler zielt (Bogen oder Magie)
	Perc_SetRange		(PERC_DRAWWEAPON		, PERC_DIST_DIALOG				);
	// wird an alle NSCs gesendet, wenn der Spieler eine Waffe (oder Spruch) zieht

	// --- HÖREN -----------------------------------------------------------------

	Perc_SetRange		(PERC_ASSESSFIGHTSOUND	, 3000							); //wird in fast allen Fällen auf PERC_DIST_INTERMEDIAT verkürzt!
	// wird an alle NSCs gesendet, wenn SC oder NSC jemanden mit Waffe trifft
	Perc_SetRange		(PERC_ASSESSQUIETSOUND	, PERC_DIST_INTERMEDIAT			);
	// wird einmal pro Sekunde an alle gesendet, wenn der Spieler geht oder rennt (ausser beim Schleichen)
	// wird jedesmal gesendet, wenn ein Item mit der Welt kollidiert (fallengelassen wird)

	// --- DIEB ------------------------------------------------------------------

	Perc_SetRange		(PERC_ASSESSTHEFT		, PERC_DIST_INTERMEDIAT			);
	// geht an alle, wenn SC (oder NSC!) ein Item aufgenommen hat
	// Relikt: Wenn SC alten Taschendiebstahl macht an alle NSCs ausser den Beklauten
	// Relikt2: an alle beim Telekinesis-Spell
	Perc_SetRange		(PERC_ASSESSUSEMOB		, PERC_DIST_INTERMEDIAT			);
	// geht an alle, wenn der SC ein Mobsi benutzt
	Perc_SetRange		(PERC_ASSESSENTERROOM	, PERC_DIST_INTERMEDIAT			);
	// geht an alle, wenn der SC einen Portalraum betritt

	// --- MAGIER ----------------------------------------------------------------

	Perc_SetRange		(PERC_ASSESSMAGIC		, 9999							); //Reichweite wird nicht vom Programm benutzt!
	// wird gesendet von VisualFXInst.d - Wahrnehmungs-Sendung hängt am Magie Effekt
	// Ein NSC, der diese Wahrnehmung bekommt, kann in der AI ZUSÄTZLICH auf Magie reagieren (i.d.R. mit ZS-Wechsel)
	// Sollte in JEDEM Zustand aktiviert sein (ausser ZS_Dead)
	Perc_SetRange		(PERC_ASSESSSTOPMAGIC	, 9999			 				); //Reichweite wird nicht vom Programm benutzt!
	// Wird an das / die Opfer gesendet, wenn der Spell aufhört zu wirken

	// --- TALK ------------------------------------------------------------------

	Perc_SetRange		(PERC_ASSESSTALK		, PERC_DIST_DIALOG				);

	// --- NSC-NSC-Kommunikation -------------------------------------------------

	Perc_SetRange		(PERC_ASSESSWARN		, PERC_DIST_INTERMEDIAT			);
	// REIN scriptgenerierte Wahrnehmung!

	// --- Türen aufmachen -------------------------------------------------------

	Perc_SetRange		(PERC_MOVEMOB			, PERC_DIST_DIALOG				);
	// Wenn NSC eine Tür im Weg ist

	// --- SC verwandelt sich / - zurück ------------------------------------------
	
	Perc_SetRange		(PERC_ASSESSSURPRISE	, FIGHT_DIST_CANCEL			 	);	// nur in ZS_Attack und ZS_MM_Attack
	// geht an alle, wenn der SC sich zurückverwandelt


		// --- RAUS (wird nicht gebraucht) -------------------------------------------

		Perc_SetRange		(PERC_OBSERVEINTRUDER	, 100							);
		// geht an alle, wenn SC stehenbleibt (außer aus dem Schleichen heraus)
		Perc_SetRange		(PERC_ASSESSREMOVEWEAPON, 100							);
		// wird an alle NSCs gesendet, wenn der Spieler die Waffe wegsteckt
		Perc_SetRange		(PERC_CATCHTHIEF		, 100							);
		// geht an NSC, wenn er den SC beim Taschendiebstahl erwischt (sich bewegt)
		Perc_SetRange		(PERC_ASSESSCALL		, 100							);
		// geht an NSC, der vom Spieler gerufen wurde (zu weit weg zum Sprechen)
		Perc_SetRange		(PERC_MOVENPC			, 100							);
		// wenn der SC dem NSC im Weg rumsteht
		Perc_SetRange		(PERC_ASSESSCASTER		, 100							);
		// wird beim 1. investierten Manapunkt gesendet
		Perc_SetRange		(PERC_NPCCOMMAND		, 100							);
		// REIN scriptgenerierte Wahrnehmung!
		Perc_SetRange		(PERC_OBSERVESUSPECT	, 100							);
		// geht alle 2 Sekunden an alle, wenn der SC schleicht (NICHT, wenn er geduckt steht)
};


// *************************************
// Normale Wahrnehmung
// *************************************

func void Perception_Set_Normal ()				//Für Humans
{
	// --- Die Senses bei jedem Zustand neu setzen (Weil in ZS_Guide_Player die Senses & Ranges verändert werden) ------
	self.senses			=	SENSE_HEAR | SENSE_SEE;
	self.senses_range	=	PERC_DIST_ACTIVE_MAX;

	// --- Takt der aktiven Wahrnehmungen ------------------------------------------------
	if (Npc_KnowsInfo(self, 1))
	|| (C_NpcIsGateGuard (self))
	{
		Npc_SetPercTime		(self, 0.3);
	}
	else
	{
		Npc_SetPercTime		(self, 1);
	};

	// --- aktiv ------------------------------------------------------------------------- //aktive Wahrnehmungen werden IMMER den passiven bevorzugt (priorisiert)
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessPlayer				); //Player wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack

	// --- passiv ------------------------------------------------------------------------ //Passive Wahrnehmungen werden durch die Reihenfolge der Anmeldung priorisiert!
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_AssessDamage				); //geht in ZS_Attack oder in ZS_ReactToDamage (bei Freunden)
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	B_AssessMurder				); //geht in ZS_Attack
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				); //geht in ZS_Attack
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 				); //geht in ZS_Attack
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessPortalCollision		); //geht in ZS_ObservePlayer. ZS_ClearRoom oder ZS_Attack
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_AssessThreat				); //geht in ZS_ReactToWeapon
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_AssessDrawWeapon			); //geht in ZS_ReactToWeapon
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			); //geht in ZS_WatchFight oder ZS_Attack
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound			); //geht in ZS_ObservePlayer
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_AssessWarn 		 	 	); //geht in ZS_Attack
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				); //geht in ZS_Talk
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
};


// ***********************************************
// Minimale Wahrnehmung - sollten IMMER aktiv sein
// ***********************************************

func void Perception_Set_Minimal ()				//Für Männer und Frauen
{
	// --- Die Senses bei jedem Zustand neu setzen (nur falls in ZS mit Perc_Set_Minimal noch ZUSÄTLZLICH (lokal) aktive Wahrnehmungen angemeldet werden) ------
	self.senses			=	SENSE_HEAR | SENSE_SEE;
	self.senses_range	=	PERC_DIST_ACTIVE_MAX;

	// --- passiv ------------------------------------------------------------------------
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_AssessDamage				);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	B_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_AssessUseMob 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_AssessPortalCollision		);
};


// ************************************************************************************************************
// B_ClearPerceptions
// ------------------
// MUSS in allen B_Befehlen, die durch Wahrnehmungen abgesprugen werden
// ÜBERALL DORT aufgerufen werden, wo ein neuer ZS aufgerufen wird
// Beachten: auch in B_Befehlen, die wiederum aus diesem B_Befehlen aufgerufen werden
// müssen alle ZS_Aufrufe mit B_ClearPerceptions versehen werden
// AUF KEINEN FALL einfach B_ClearPerceptions in jeden B_Befehl, der durch eine Wahrnehmung aufgerufen wird,
// reinmachen (so daß er IMMER aufgerufen würde) - das würde dazu führen, daß ein B_Befehl, in einem Fall in dem
// KEIN ZS_Wechsel passiert, dem aktuellen ZS alle Wahrnehmungen plattmacht.
// ************************************************************************************************************

func void B_ClearPerceptions (var C_NPC slf)
{
	// ------ Aktive Wahrnehmungen der Perception_Set_Normal und Minimal disablen -------
	Npc_PercDisable  	(slf, 	PERC_ASSESSPLAYER		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSENEMY		);

	// ------ Aktive Wahrnehmungen, die von Monstern benutzt werden disablen ------
	Npc_PercDisable  	(slf, 	PERC_ASSESSBODY			);

	// ------ Passive Wahrnehmungen der Perception_Set_Normal und Minimal disablen -------
	Npc_PercDisable  	(slf, 	PERC_ASSESSMAGIC		);
	Npc_PercDisable  	(slf,	PERC_ASSESSDAMAGE		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSMURDER		);
	Npc_PercDisable  	(slf, 	PERC_ASSESSTHEFT		);
	Npc_PercDisable  	(slf,	PERC_ASSESSUSEMOB		);
	Npc_PercDisable  	(slf,	PERC_ASSESSENTERROOM	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSTHREAT		);
	Npc_PercDisable  	(slf,	PERC_DRAWWEAPON			);
	Npc_PercDisable  	(slf, 	PERC_ASSESSFIGHTSOUND	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSQUIETSOUND	);
	Npc_PercDisable  	(slf, 	PERC_ASSESSWARN			);
	Npc_PercDisable  	(slf, 	PERC_ASSESSTALK			);
	Npc_PercDisable  	(slf, 	PERC_MOVEMOB			);

	// ------ Wahrnehmungen disablen, die sonstwo benutzt werden ------
	Npc_PercDisable  	(slf, 	PERC_ASSESSOTHERSDAMAGE	);			//wird i.d.R. nur von Monster-AI benutz (einige ZS) und lokal in ZS_WatchFight
	Npc_PercDisable  	(slf, 	PERC_ASSESSSTOPMAGIC	);			//wird in einigen ZS_Magic lokal benutzt und aus Spell_ProcessMana_Release versendet
	Npc_PercDisable  	(slf, 	PERC_ASSESSSURPRISE		);

	// ------ Wahrnehmungen, dich nicht von der AI benutzt werden ------
	//Npc_PercDisable  	(slf, 	PERC_ASSESSFIGHTER		);
	//Npc_PercDisable  	(slf, 	PERC_ASSESSITEM			);
	//Npc_PercDisable  	(slf, 	PERC_OBSERVEINTRUDER	);
	//Npc_PercDisable  	(slf, 	PERC_ASSESSREMOVEWEAPON	);
	//Npc_PercDisable  	(slf, 	PERC_CATCHTHIEF			);
	//Npc_PercDisable  	(slf, 	PERC_ASSESSDEFEAT		);
	//Npc_PercDisable  	(slf, 	PERC_ASSESSCALL			);
	//Npc_PercDisable  	(slf, 	PERC_MOVENPC			);
	//Npc_PercDisable  	(slf, 	PERC_ASSESSCASTER		);
	//Npc_PercDisable  	(slf, 	PERC_NPCCOMMAND			);
	//Npc_PercDisable  	(slf, 	PERC_OBSERVESUSPECT		);
};


// *********************************
// Monster und Orks - Daily Routines
// *********************************

func void Perception_Set_Monster_Rtn ()
{
	Npc_SetPercTime 	(self, 1);

	Npc_PercEnable		(self, PERC_ASSESSENEMY			,	B_MM_AssessEnemy); 			//geht in ZS_MM_ThreatenEnemy, ZS_MM_Hunt oder ZS_MM_Attack / Orks immer in Attack
	Npc_PercEnable 		(self, PERC_ASSESSBODY			, 	B_MM_AssessBody);			//geht in ZS_MM_EatBody / Orks ignorieren

	Npc_PercEnable		(self, PERC_ASSESSMAGIC			,	B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE		,	B_MM_AssessDamage); 		//geht in ZS_MM_Attack
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE	, 	B_MM_AssessOthersDamage); 	//geht in ZS_MM Attack oder ZS_MM_Flee / Orks immer in Attack
	Npc_PercEnable		(self, PERC_ASSESSMURDER		, 	B_MM_AssessOthersDamage);
	Npc_PercEnable		(self, PERC_ASSESSWARN			,	B_MM_AssessWarn); 			//geht in ZS_MM_ThreatenEnemy, ZS_MM Attack oder ZS_MM_Flee / Orks ignorieren
};


