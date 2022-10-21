// ************************************
// B_ReadySpell
// ------------
// FIX für 2 Probleme von AI_ReadySpell
// ************************************

func void B_ReadySpell(var C_NPC slf, var int spell, var int mana)
{
	
	// IMMER VOLLES MANA
	
	if (slf.attribute[ATR_MANA_MAX] < mana)
	{
		Npc_ChangeAttribute	(slf, ATR_MANA_MAX, mana);
	};
	
	if (slf.attribute[ATR_MANA] < mana)
	{
		Npc_ChangeAttribute	(slf, ATR_MANA, mana);
	};
	

	// EXIT IF...
	
	// ------ NSC zieht diesen Zauber bereits ------
	if ( Npc_IsDrawingSpell(slf) == spell )
	{
		return;
	}	
	
	// ------ NSC hat Zauber schon auf der Hand ------
	if (Npc_GetActiveSpell(slf) == spell) 
	{
		return;		
	}
	else if (Npc_GetActiveSpell(slf) != -1) 
	{
		// NSC hat bereits anderen Spell auf der Hand -> removen
		AI_RemoveWeapon (slf);
	};

	// FUNC
	
	// ------ Alten Spruch / Waffe wegstecken ------
	// [EDENFELD] Dies ist ein Relikt aus alten Zeiten, auskommentiert!
	//if (!Npc_IsInFightMode(slf, FMODE_NONE))				// wenn self irgendeine Waffe oder Spruch gezogen hat
	//{
		//AI_RemoveWeapon (slf);	// AI_ReadySpell DARF NIE zweimal hintereinander aufgerufen werden, ohne daß AI_RemoveWeapon dazwischen kommt (Fehler: "Only one MOB allowed without collision")
	//}

	// ------ Spruch ziehen ------
	AI_ReadySpell (slf, spell, mana);
	
	// AI_ReadySpell() setzt voraus, daß
	// a) der NPC MANA_MAX > 0 hat (haben alle NSCs)
	// b) der NPC die entsprechende Rune im Inventory hat, equippt wird sie automatisch
};
