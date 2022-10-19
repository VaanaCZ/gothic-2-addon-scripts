// **********
// B_ResetAll
// **********

func void B_ResetAll (var C_NPC slf)
{
	// ------ NSC hört ggf. auf zu glotzen ------
	B_StopLookAt (slf);
	
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (slf);
};
