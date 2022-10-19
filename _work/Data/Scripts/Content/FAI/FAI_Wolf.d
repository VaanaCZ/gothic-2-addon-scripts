// ********************
// Kampf - AI Wolf (22)
// ********************


// ************************************
// Meine Reaktionen auf Gegner-Aktionen
// ************************************

// ------ Gegner attackiert mich ------
INSTANCE FA_ENEMY_PREHIT_22 (C_FightAI)
{
 	move[0] = MOVE_JUMPBACK;
 	move[1] = MOVE_STRAFE;
};

// ------ Gegner macht Sturmattacke ------
INSTANCE FA_ENEMY_STORMPREHIT_22 (C_FightAI)
{
 	move[0] = MOVE_STRAFE;
};


// *******************************************
// Gegner in W-Reichweite (Treffer-Reichweite)
// *******************************************

// ------ Ich renne auf den Gegner zu ------
INSTANCE FA_MY_W_RUNTO_22 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- Stehenbleiben ---
};

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_W_STRAFE_22 (C_FightAI)
{
 	move[0] = MOVE_STRAFE; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner im Fokus (kann treffen) -------
INSTANCE FA_MY_W_FOCUS_22 (C_FightAI)
{
 	move[0] = MOVE_ATTACK;
 	move[1] = MOVE_WAIT;
};

// ------- Ich habe Gegner NICHT im Fokus -------
INSTANCE FA_MY_W_NOFOCUS_22 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// *************************************************
// Gegner in G-Reichweite (Sturmattacken-Reichweite)
// *************************************************

// ------ Ich renne auf den Gegner zu (kann treffen) ------
INSTANCE FA_MY_G_RUNTO_22 (C_FightAI)
{
 	move[0] = MOVE_ATTACK; //Sturmattacke
};

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_G_STRAFE_22 (C_FightAI)
{
 	 move[0] = MOVE_STRAFE; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner im Fokus -------
INSTANCE FA_MY_G_FOCUS_22 (C_FightAI)
{
 	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};


// ***************************************
// Gegner in FK-Reichweite (weit entfernt)
// ***************************************

// ------- Ich habe Gegner im Fokus -------
INSTANCE FA_MY_FK_FOCUS_22 (C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner NICHT im Fokus (gilt auch für G-Distanz!) -------
INSTANCE FA_MY_G_FK_NOFOCUS_22 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// ***********************************
// FAI für Fernkampf und Magie 
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
INSTANCE FA_MY_FK_FOCUS_FAR_22 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
};

// ------ Gegner NICHT im Fokus ------
INSTANCE FA_MY_FK_NOFOCUS_FAR_22 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// ***********************************
// FAI für Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
INSTANCE FA_MY_FK_FOCUS_MAG_22 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

// ------ Gegner NICHT im Fokus -------
INSTANCE FA_MY_FK_NOFOCUS_MAG_22 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};
