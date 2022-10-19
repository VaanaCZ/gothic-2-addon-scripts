// **********************
// Kampf - AI Dragon (39)
// **********************

/*
MOVE_RUN				Gegner in meinem Fokus + steht wer dazwischen? (G)
MOVE_RUNBACK			Gegner in meinem Fokus
MOVE_JUMPBACK			löst t_ParadeJumpB aus (Attacke wird nur pariert, wenn man schnell genug aus der W-Reichweite kommt!
MOVE_TURN				Immer bis Gegner im Fokus (also nie durch neue Aktion unterbrochen, höchstens durch Gegner-Attacke)
MOVE_STRAFE				(Richtung wird vom Programm entschieden)

MOVE_ATTACK				in ComboZone = Combo / im Rennen = Sturmattacke

MOVE_PARADE			
MOVE_STANDUP		
MOVE_WAIT				200 ms
*/


// ************************************
// Meine Reaktionen auf Gegner-Aktionen
// ************************************

// ------ Gegner attackiert mich ------
INSTANCE FA_ENEMY_PREHIT_39 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_ATTACK;
	move[3] = MOVE_ATTACK;
	move[4] = MOVE_ATTACK;
};

// ------ Gegner macht Sturmattacke ------
INSTANCE FA_ENEMY_STORMPREHIT_39 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_ATTACK;
};


// *******************************************
// Gegner in W-Reichweite (Treffer-Reichweite)
// *******************************************

// ------ Ich bin im Combo-Fenster ------
INSTANCE FA_MY_W_COMBO_39 (C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------ Ich renne auf den Gegner zu ------
INSTANCE FA_MY_W_RUNTO_39 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG (Stehenbleiben) ---
};

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_W_STRAFE_39 (C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------- Ich habe Gegner im Fokus (kann treffen) -------
INSTANCE FA_MY_W_FOCUS_39 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_ATTACK;
	move[3] = MOVE_ATTACK;
};

// ------- Ich habe Gegner NICHT im Fokus -------
INSTANCE FA_MY_W_NOFOCUS_39 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// *************************************************
// Gegner in G-Reichweite (Sturmattacken-Reichweite)
// *************************************************

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_G_COMBO_39 (C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------ Ich renne auf den Gegner zu (kann treffen) ------
INSTANCE FA_MY_G_RUNTO_39 (C_FightAI)
{
	//move[0] = MOVE_ATTACK; 	//Sturmattacke geht bei Drache nicht
	move[0] = MOVE_TURN; 		//Stehenbleiben
};

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_G_STRAFE_39 (C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------- Ich habe Gegner im Fokus -------
INSTANCE FA_MY_G_FOCUS_39 (C_FightAI)
{
	//move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_ATTACK;
	move[3] = MOVE_ATTACK;
};

// ***************************************
// Gegner in FK-Reichweite (weit entfernt)
// ***************************************

// ------- Ich habe Gegner im Fokus -------
INSTANCE FA_MY_FK_FOCUS_39 (C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner NICHT im Fokus (gilt auch für G-Distanz!) -------
INSTANCE FA_MY_G_FK_NOFOCUS_39 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// ***********************************
// FAI für Fernkampf
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
INSTANCE FA_MY_FK_FOCUS_FAR_39 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
};

// ------ Gegner NICHT im Fokus ------
INSTANCE FA_MY_FK_NOFOCUS_FAR_39 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// ***********************************
// FAI für Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
INSTANCE FA_MY_FK_FOCUS_MAG_39 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
	move[1] = MOVE_TURN;
	//move[2] = MOVE_WAIT_EXT;
	//move[3] = MOVE_WAIT_EXT;
};

// ------ Gegner NICHT im Fokus -------
INSTANCE FA_MY_FK_NOFOCUS_MAG_39 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};



