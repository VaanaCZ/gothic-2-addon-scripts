// *****************************
// B_SetAttitude
// -----------------------------
// setzt die Attitьde zum Player
// (temp UND perm)
// *****************************

func void B_SetAttitude (var C_NPC slf, var int att)
{
	// ------ perm Att setzen ------
	Npc_SetAttitude (slf, att);
	
	// ------ temp Att setzen ------
	Npc_SetTempAttitude (slf, att);
};



