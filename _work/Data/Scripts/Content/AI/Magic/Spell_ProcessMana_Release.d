// ***********************************************************************************************************
// Spell_ProcessMana_Release
// -------------------------
// wird aufgerufen, NACHDEM die Action Taste losgelassen wurde, 
// und in Spell_ProcessMana der Spruch NOCH NICHT GECASTED und NOCH NICHT GESTOPPT wurde
// es macht keinen Sinn, diese Funktion was anderes als SPL_SENDSTOP oder SPL_SENDCAST zurückliefern zu lassen
// self 	= Der Caster
// other 	= Das Opfer (kann auch leer sein)
// ***********************************************************************************************************

func int Spell_ProcessMana_Release (var int manaInvested)
{
	var int activeSpell; activeSpell = Npc_GetActiveSpell(self);
	
	// ------ Spells, die beim loslassen der Taste gecastet werden ------
	if (activeSpell == SPL_Pyrokinesis		)	{	return	SPL_SENDCAST;	}; //ALIAS CHARGE FIRESTORM!!!
	if (activeSpell == SPL_ChargeFireball	)	{	return	SPL_SENDCAST;	};
	if (activeSpell == SPL_ChargeZap		)	{	return	SPL_SENDCAST;	};
	if (activeSpell == SPL_WINDFIST			)	{	return	SPL_SENDCAST;	};

	// ------ Alle anderen Spells (Aufrechterhaltung oder Loslassen OHNE gecastet zu haben (zu wenig investiert) ------	
	return SPL_SENDSTOP;
};
